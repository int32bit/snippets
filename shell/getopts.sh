#!/bin/bash
# Usage: getopts optstring name [args]

# getopts  is  used  by shell procedures to parse positional parameters.  optstring contains the option characters to be recognized; if a character is
# followed by a colon, the option is expected to have an argument, which should be separated from it by white space.   The  colon  and  question  mark
# characters  may  not be used as option characters.  Each time it is invoked, getopts places the next option in the shell variable name, initializing
# name if it does not exist, and the index of the next argument to be processed into the variable OPTIND.  OPTIND is initialized to 1  each  time  the
# shell or a shell script is invoked.  When an option requires an argument, getopts places that argument into the variable OPTARG.  The shell does not
# reset OPTIND automatically; it must be manually reset between multiple calls to getopts within the same shell invocation if a new set of  parameters
# is to be used.
#
# When  the  end  of  options is encountered, getopts exits with a return value greater than zero.  OPTIND is set to the index of the first non-option
# argument, and name is set to ?.
#
# getopts normally parses the positional parameters, but if more arguments are given in args, getopts parses those instead.
#
# getopts can report errors in two ways.  If the first character of optstring is a colon, silent error reporting is used.  In normal operation,  diag-
# nostic messages are printed when invalid options or missing option arguments are encountered.  If the variable OPTERR is set to 0, no error messages
# will be displayed, even if the first character of optstring is not a colon.
#
# If an invalid option is seen, getopts places ? into name and, if not silent, prints an error message and unsets OPTARG.  If getopts is  silent,  the
# option character found is placed in OPTARG and no diagnostic message is printed.
#
# If  a required argument is not found, and getopts is not silent, a question mark (?) is placed in name, OPTARG is unset, and a diagnostic message is
# printed.  If getopts is silent, then a colon (:) is placed in name and OPTARG is set to the option character found.
#
# getopts returns true if an option, specified or unspecified, is found.  It returns false if the end of options is encountered or an error occurs.

#while getopts 'u:p:h' OPT # don't supress error, prints an error message and unset OPTARG.

while getopts ':u:p:h' OPT # supress error
do
    case $OPT in
        u)
            echo "parse '-u' option: value=${OPTARG} index=${OPTIND}"
            ;;
        p)
            echo "parse '-p' option: value=${OPTARG} index=${OPTIND}"
            ;;
        h)
            echo "parse '-h' option: value=${OPTARG} index=${OPTIND}"
            ;;
        ?)
            echo "Invalid option at ${OPTIND}"
            ;;
    esac
done

echo $@
