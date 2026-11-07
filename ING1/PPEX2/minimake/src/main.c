#include <stdio.h>

#include "lib.h"

static void print_help(void)
{
    printf("Usage: minimake [options] [target] ...\n");
    printf("Options:\n");
    printf("  -f FILE, --file=FILE, --makefile=FILE\n");
    printf("                  Read FILE as a makefile.\n");
    printf("  -h, --help      Print this message and exit.\n");
    printf("  -p, --print-data-base, --pretty-print\n");
    printf("                  Print the parsed makefile.\n");
}

int main(int argc, char **argv)
{
    struct options opt;
    enum parse_status st = parse_args(argc, argv, &opt);
    if (st == PARSE_HELP)
    {
        print_help();
        return 0;
    }
    if (st == PARSE_BAD_OPTION)
    {
        print_help();
        return 2;
    }
    if (st == PARSE_EMPTY_ARG)
    {
        fprintf(stderr,
                "minimake: *** empty string invalid as argument. Stop.\n");
        return 2;
    }

    const char *filename = opt.makefile;
    if (filename == NULL)
        filename = "Makefile";

    struct makefile make;
    if (parse_makefile(filename, &make) != 0)
        return 2;
    if (opt.print)
        print_makefile(&make);
    return 0;
}
