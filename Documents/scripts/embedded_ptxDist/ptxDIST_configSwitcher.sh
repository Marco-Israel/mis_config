#!/bin/bash

_usage() {
cat <<-EOF
                "${0##*/}"
################################################################################

@author    Marco Israel (MI)
@date      2020-TODO
@authors   Last changed by:  Marco Israel - 2020.


@brief      Switch ptxdist configs eg to development
@details    Switch ptxdist configs eg to development


  USAGE:
 "${0##*/}" <-d or -p>

 -d     REQUIRED if not -p is set: Switch to developing config
 -p     REQUIRED if not -d is set:Switch to productive config
        NOTE one of both is required

 -h     Show this help//.


 @example
 "${0##*/}" -d


 @node  NOTE: Currently only the ptxdist packet selection config is toggelt
              between development and productive (normal) selection.

 @todo  TODO: Add script parameters and functions to switch other configurations
 @todo  TODO: Make it possible to select between different configuration of the
              same type. E.g.  like "test" "debug" "development" "productive".



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
#Local global variables
declare -a _CONFIGACTIVE=("./configs/systems/qt/ptxconfig" "./configs/systems/qt/ptxconfig.old")

declare -a _CONFIGPRODUCTIVE=("configs/systems/qt/ptxconfig.productive" "./configs/systems/qt/ptxconfig.productive.old")

declare -a _CONFIGDEVELOPING=("configs/systems/qt/ptxconfig.development" "./configs/systems/qt/ptxconfig.development.old")

################################################################################
#Local functions
_getopts() {

    while getopts "h:s:" OPT
    do
    	case "$OPT" in
        s)
            if [[ "${OPTARG}" == "d" ]]                                        \
                || [[ "${OPTARG}" == "dev" ]]                                  \
                || [[ "${OPTARG}" == "developting" ]]
            then
                _switchToDeveloping
            elif [[ "${OPTARG}" == "p" ]]                                      \
                || [[ "${OPTARG}" == "pro" ]]                                  \
                || [[ "${OPTARG}" == "productive" ]]
            then
                _switchToProductive
            else
                echo "Wrong option. See help"
                _usage
                echo "Exit now with error"
                echo ${OPTARG}
                echo $2
                exit 1
            fi
            exit 0
            ;;
    	*)  _usage
            exit 0
    		;;
    	esac
       shift $((OPTIND -1))
    done
}

_switchToDeveloping() {
    echo "SWITCHING:"
    for (( INDEX=0; INDEX < ${#_CONFIGACTIVE[@]}; INDEX++ ))
    do
        echo "-----------------------------------------------------------------"
        echo "SAVE "${_CONFIGACTIVE[$INDEX]}" --> "${_CONFIGDEVELOPING[$INDEX]}
        cp "${_CONFIGACTIVE[$INDEX]}" "${_CONFIGDEVELOPING[$INDEX]}"
        echo "SET ${_CONFIGDEVELOPING[$INDEX]}  -->   ${_CONFIGACTIVE[$INDEX]}"
        cp "${_CONFIGDEVELOPING[$INDEX]}" "${_CONFIGACTIVE[$INDEX]}"
        echo "-----------------------------------------------------------------"
    done
    echo "FINISHED"
}


_switchToProductive() {
    echo "SWITCHING:"
    for (( INDEX=0; INDEX < ${#_CONFIGACTIVE[@]}; INDEX++ ))
    do
        echo "-----------------------------------------------------------------"
        echo "SAVE ${_CONFIGACTIVE[$INDEX]}  -->   ${_CONFIGDEVELOPING[$INDEX]}"
        cp "${_CONFIGACTIVE[$INDEX]}" "${_CONFIGDEVELOPING[$INDEX]}"
        echo "SET ${_CONFIGPRODUCTIVEO[$INDEX]}  -->   ${_CONFIGACTIVE[$INDEX]}"
        cp "${_CONFIGPRODUCTIVE[$INDEX]}" "${_CONFIGACTIVE[$INDEX]}"
        echo "-----------------------------------------------------------------"
    done
    echo "FINISHED"
}



##### MAIN #####################################################################

if [ "$#" -gt 0 ] && [ "$#" -lt 3 ]
then
    _getopts "$@"
else
    echo "EXACTLY ON parameter is required. See help."
    _usage

    echo "Exit now with error"
    exit 1
fi

##### EOF ######################################################################
