#!/bin/bash

_usage() {
cat <<-EOF
                "${0##*/}"
################################################################################

@author    Marco Israel (MI)
@date      2020-TODO
@authors   Last changed by:  Marco Israel - 2020.


@brief     This is only a dummy brief. TODO change this!
@details   This is only a dummy detail description. TODO change this!


  USAGE:
 "${0##*/} <yourRequiredParameter>  [<yourOptionalParameter>]  [<moreOptional>]"

 -p     Requiremed. Some required Parameterdscription TODO.

 -o     Optional. Some otional Parameterdscription TODO.

 -h     Show this help.


 @example
 "${0##*/} -p <yourPath/yourFile>  [-o <optionalFlag>]"


 @node  NOTE:   Some usefull information TODO.

 @todo  TODO:   Some known open (required) tasks.

 @attention     ATTENTION:  Some importan information.  TODO.
 @warning       WARN: Same as above. TODO


 @copyright     Available under the MIT License.

                Copyright (C) 2020 Marco Israel (MI).       All rights reserved.

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
the Software, and to permit persons to whom the Software is furnished to do so,
subject to the following conditions:

The above copyright notice and this permission notice shall and MUST BE
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

################################################################################
# END OF HELP.
EOF
}

################################################################################
#File global variables

VAR1="TODO"
VAR2=$VAR1
VAR3=$VAR1



################################################################################
#File local functions
_getopts() {

        # TODO select only once, depending on how to get the parameters.
    while getopts "h:o:p:" OPT
    do
    	case "$OPT" in
    	o)  echo TODO
    	    ;;
    	p)  echo TODO
    	    ;;
        *)
            if [[ "${1}" == "-h" ]]                                         \
                || [[ "${1}" == "h" ]]                                      \
                || [[ "${1}" == "help" ]]                                   \
                || [[ "${1}" == "--help" ]]
            then
                echo TODO
            else
                _usage
            fi
            ;;
    	esac
       shift $((OPTIND -1))
    done
}

#_getopts() {
#while [ $# -gt 0 ]
#    do
#        case "$1" in
#            01 | --opt1)
#                echo "TODO"
#                ;;
#            O2 | option2)
#				echo "TODO"
#                ;;
#            *) echo TODO
#                echo "TODO"
#                ;;
#        esac
#        shift
#    done
#}
#

##### MAIN #####################################################################

if [ "$#" -gt 1 ]
then

    _getopts "$@"

else
   _usage

#    echo "#####################################################################"
#    echo ""
#    echo "USAGE:"
#    echo "${0##*/} [<serach-engin>] \"<search string>\""
#    echo ""
#    echo "#####################################################################"
fi

##### EOF ######################################################################
