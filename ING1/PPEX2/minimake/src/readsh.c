#include <getopt.h>
#include <stddef.h>

#include "lib.h"

static struct option long_opts[] = {
    { "file", required_argument, NULL, 'f' },
    { "makefile", required_argument, NULL, 'f' },
    { "help", no_argument, NULL, 'h' },
    { "print-data-base", no_argument, NULL, 'p' },
    { "pretty-print", no_argument, NULL, 'p' },
    { NULL, 0, NULL, 0 }
};

// Lit les options et les cibles de la ligne de commande
enum parse_status parse_args(int argc, char **argv, struct options *opt)
{
    opt->makefile = NULL;
    opt->print = 0;
    int help = 0;
    int bad_option = 0;
    int empty_arg = 0;
    opterr = 0;
    int c;
    while ((c = getopt_long(argc, argv, "f:hp", long_opts, NULL)) != -1)
    {
        switch (c)
        {
        case 'f':
            if (optarg[0] == '\0')
                empty_arg = 1;
            opt->makefile = optarg;
            break;
        case 'h':
            help = 1;
            break;
        case 'p':
            opt->print = 1;
            break;
        default:
            bad_option = 1;
            break;
        }
    }
    opt->targets = &argv[optind];
    opt->nb_targets = argc - optind;
    for (int i = 0; i < opt->nb_targets; i++)
        if (opt->targets[i][0] == '\0')
            empty_arg = 1;
    if (help)
        return PARSE_HELP;
    if (bad_option)
        return PARSE_BAD_OPTION;
    if (empty_arg)
        return PARSE_EMPTY_ARG;
    return PARSE_OK;
}
