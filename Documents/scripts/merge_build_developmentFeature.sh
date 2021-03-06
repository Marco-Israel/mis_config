#!/bin/bash

_usage() {
cat <<-EOF
                "${0##*/}"
################################################################################

@author    Marco Israel (MI)
@date      2021-03
@brief     Mmerge the remote develop branch into your feature branche. Build all
@details   Its a simple script to merge the remote develop branch into your
           current git checkout feature branch. Afterwards it builds, formats
           and lints the code in a batch. You can to take a coffe or tea or
           water or .. in the while of building and linting. (While hoping that
           nothing will break).

@attention  * Make shure you are in your project root directory when calling
                this script (where the .git folder lifes).
            * Make shure you are in your feature branch where you like to merge
                the current up-to-date upstream develop branch into it.

  USAGE:
 ${0##*/}  [ -c, -l ]
    -l      Start the linting
    -c      Build a coverage report

@examle
Only merge and clean build
${0##*/}

Merge the remote develop branch, build the project, coverage report and to the
linting in on step
${0##*/} -c -l

################################################################################
# END OF HELP.
EOF
}

_LINT_=0
_COVERAGE_=0

################################################################################
# @brief    Get the script arguments. (In case you need this in the future=
################################################################################
_getopts() {

        # TODO select only once, depending on how to get the parameters.
    while getopts "l:c:" OPT
    do
    	case "$OPT" in
        l)  _LINT_=1
            ;;
        c)  _COVERAGE_=1
            ;;
        *)
             _usage
            ;;
    	esac
       shift $((OPTIND -1))
    done
}



################################################################################
# @brief    MAIN
################################################################################
_main() {
    _getopts "$@"

    git merge origin/develop

    if [ -d ./staging ]
    then
        rm -rf ./staging
    fi

    if [ -d ./build ]
    then
        rm -rf ./build
    fi

    mkdir build && cd build
    cmake -DCMAKE_BUILD_TYPE=Debug -DCRYPTOSERVICE_BUILD_EXAMPLES=ON ..
    make -j16 thirdparty && make -j16 && make format-all && cd ..


    if [ $_LINT_ -eq 1 ]
    then
        if [ -d ./pclint ]
        then
            rm -rf ./pclint
            mkdir pclint && cd pclint
            cmake .. && make lint && cat ./pclint/pclint-report.txt && cd ..
        fi
    fi

    if [ $_COVERAGE_ -eq 1 ]
    then
        cd build
        cmake -DCMAKE_BUILD_TYPE=Debug -DCRYPTOSERVICE_ENABLE_COVERAGE=ON ..
        make coverage-report-html
        make coverage-report
        cd ..
    fi

    echo ""
    echo " BUILD FINISHED "
}
_main "$@"

##### EOF ######################################################################
