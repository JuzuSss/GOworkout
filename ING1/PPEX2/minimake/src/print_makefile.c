#include <stdio.h>

#include "lib.h"

// (foo): [foo.o bar.o] puis une ligne par commande
static void print_rule(struct rule *rule)
{
    printf("(%s): [", rule->target);
    for (size_t i = 0; i < rule->nb_deps; i++)
    {
        if (i > 0)
            printf(" ");
        printf("%s", rule->deps[i]);
    }
    printf("]\n");

    for (size_t i = 0; i < rule->nb_recipe; i++)
        printf("\t'%s'\n", rule->recipe[i]);
}

void print_makefile(struct makefile *make)
{
    printf("# variables\n");
    for (size_t i = 0; i < make->nb_vars; i++)
        printf("'%s' = '%s'\n", make->vars[i].name, make->vars[i].value);

    printf("# rules\n");
    for (size_t i = 0; i < make->nb_rules; i++)
        print_rule(&make->rules[i]);
}
