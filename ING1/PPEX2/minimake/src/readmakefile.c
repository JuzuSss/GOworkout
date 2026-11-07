#define _POSIX_C_SOURCE 200809L

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "lib.h"

static int is_space(char c)
{
    return c == ' ' || c == '\t';
}

static void add_variable(struct variable *var, char *line)
{
    size_t size = strlen(line) + 1;
    char *name = malloc(size);
    char *value = malloc(size);
    size_t i = 0;
    size_t j = 0;

    while (line[i] != '=')
    {
        if (!is_space(line[i]))
        {
            name[j] = line[i];
            j++;
        }
        i++;
    }
    name[j] = '\0';

    i++;
    while (is_space(line[i]))
        i++;

    j = 0;
    while (line[i] != '\0')
    {
        value[j] = line[i];
        j++;
        i++;
    }
    value[j] = '\0';

    var->name = name;
    var->value = value;
}

static void read_deps(struct rule *rule, char *deps)
{
    size_t size = strlen(deps) + 1;
    size_t i = 0;

    while (deps[i] != '\0')
    {
        if (is_space(deps[i]))
        {
            i++;
            continue;
        }

        char *word = malloc(size);
        size_t j = 0;

        while (deps[i] != '\0' && !is_space(deps[i]))
        {
            word[j] = deps[i];
            j++;
            i++;
        }
        word[j] = '\0';

        rule->deps = realloc(rule->deps, (rule->nb_deps + 1) * sizeof(char *));
        rule->deps[rule->nb_deps] = word;
        rule->nb_deps++;
    }
}

static struct rule *add_rule(struct makefile *make, char *line)
{
    make->rules =
        realloc(make->rules, (make->nb_rules + 1) * sizeof(struct rule));
    struct rule *rule = &make->rules[make->nb_rules];
    make->nb_rules++;

    rule->target = malloc(strlen(line) + 1);
    rule->deps = NULL;
    rule->nb_deps = 0;
    rule->recipe = NULL;
    rule->nb_recipe = 0;

    size_t i = 0;
    size_t j = 0;
    while (line[i] != ':') // sur foo:foo.o prend foo
    {
        if (!is_space(line[i]))
        {
            rule->target[j] = line[i];
            j++;
        }
        i++;
    }

    rule->target[j] = '\0';
    read_deps(rule, line + i + 1); // i s arrete a ':' prend foo.o
    return rule;
}

void add_command(struct rule *rule, char *cmd)
{
    rule->recipe =
        realloc(rule->recipe, (rule->nb_recipe + 1) * sizeof(char *));
    rule->recipe[rule->nb_recipe] = strdup(cmd);
    rule->nb_recipe++;
}

static int parse_line(struct makefile *make, char *line, struct rule **current)
{
    if (line[0] == '\0')
    {
        return 0;
    }

    if (line[0] == '\t')
    {
        if (*current == NULL)
        {
            fprintf(stderr, "minimake: command outside of rule.\n");
            return -1;
        }
        add_command(*current, line + 1); // saute le tab
        return 0;
    }

    char *p = strpbrk(line, ":="); // trouver les variables et de rules

    if (p != NULL && *p == '=')
    {
        make->vars =
            realloc(make->vars, (make->nb_vars + 1) * sizeof(struct variable));
        add_variable(&make->vars[make->nb_vars], line);
        make->nb_vars++;
        *current = NULL;
    }

    else if (p != NULL && *p == ':')
    {
        *current = add_rule(make, line);
    }
    return 0;
}

int parse_makefile(const char *filename, struct makefile *make)
{
    FILE *file = fopen(filename, "r");
    if (file == NULL)
    {
        fprintf(stderr, "Error during reading file\n");
        return -1;
    }

    make->vars = NULL;
    make->nb_vars = 0;
    make->rules = NULL;
    make->nb_rules = 0;

    char *line = NULL;
    size_t len = 0;
    struct rule *current = NULL;
    int ret = 0;

    while (ret == 0 && getline(&line, &len, file) != -1)
    {
        size_t n = strlen(line);
        if (n > 0 && line[n - 1] == '\n')
        {
            line[n - 1] = '\0';
        }
        ret = parse_line(make, line, &current);
    }
    free(line);
    fclose(file);
    return ret;
}
