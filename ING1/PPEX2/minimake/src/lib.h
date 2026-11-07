#ifndef LIB_H
#define LIB_H

#include <stddef.h>

struct options
{
    const char *makefile;
    int print;
    char **targets;
    int nb_targets;
};

enum parse_status
{
    PARSE_OK,
    PARSE_HELP,
    PARSE_BAD_OPTION,
    PARSE_EMPTY_ARG,
};

enum parse_status parse_args(int argc, char **argv, struct options *opt);

struct variable
{
    char *name;
    char *value;
};

struct rule
{
    char *target;
    char **deps;
    size_t nb_deps;
    char **recipe;
    size_t nb_recipe;
};

struct makefile
{
    struct variable *vars;
    size_t nb_vars;
    struct rule *rules;
    size_t nb_rules;
};

int parse_makefile(const char *filename, struct makefile *make);
void print_makefile(struct makefile *make);

#endif /* LIB_H */
