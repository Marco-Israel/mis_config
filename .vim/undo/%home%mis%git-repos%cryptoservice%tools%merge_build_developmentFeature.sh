Vim�UnDo� ����|'�q��]�ˏ�?T��d�}Y��   �                                   `�j�    _�                     c       ����                                                                                                                                                                                                                                                                                                                                                             `�j�     �               �   #!/bin/bash       
_usage() {   
cat <<-EOF                   "${0##*/}"   P################################################################################       @author    Marco Israel (MI)   @date      2021-03   P@brief     Mmerge the remote develop branch into your feature branche. Build all   K@details   Its a simple script to merge the remote develop branch into your   M           current git checkout feature branch. Afterwards it builds, formats   K           and lints the code in a batch. You can to take a coffe or tea or   O           water or .. in the while of building and linting. (While hoping that              nothing will break).       L@attention  * Make shure you are in your project root directory when calling   :                this script (where the .git folder lifes).   O            * Make shure you are in your feature branch where you like to merge   G                the current up-to-date upstream develop branch into it.         USAGE:    ${0##*/}  [ -c, -l ]       -l      Start the linting   *    -c      Do NOT build a coverage report       -t      Do NOT run the test   N    -f      Force the build process. Dont break when the script detects errors       @examle   Only merge and clean build   ${0##*/}       NMerge the remote develop branch, build the project, coverage report and to the   :linting in on step and run the unit and integration tests.   ${0##*/}           NMerge the remote develop branch, build the project, but do NUT coverage report   and to the linting   ${0##*/} -c -l -t       P################################################################################   # END OF HELP.   EOF   }       _LINT_=1   _COVERAGE_=1   _TEST_=1   	_FORCE_=0       P################################################################################   K# @brief    Get the script arguments. (In case you need this in the future=   P################################################################################   _getopts() {       D    # TODO select only once, depending on how to get the parameters.        while getopts "i:l:c:f:" OPT       do           case "$OPT" in               t)  _TEST_=0               ;;               l)  _LINT_=0               ;;               c)  _COVERAGE_=0               ;;               f) _FORCE_=1               ;;               *) _usage               ;;           esac           shift $((OPTIND -1))       done   }               P################################################################################   # @brief    MAIN   P################################################################################   	_main() {       _getopts "$@"           git merge origin/develop       git submodule update --init           if [ -d ./staging ]       then           rm -rf ./staging       fi           if [ -d ./build ]       then           rm -rf ./build       fi           mkdir build && cd build   M    cmake -DCMAKE_BUILD_TYPE=Debug -DCRYPTOSERVICE_BUILD_EXAMPLES=ON        \   (    -DCRYPTOSERVICE_BUILD_EXAMPLES=ON ..   8    make -j16 thirdparty && make -j16 && make format-all       M    if [ ! -f ./tests/unit/cs_unit ]                                        \   1    || [ ! -f ./tests/integration/cs_integration]       then   P        echo "-----------------------------------------------------------------"   (        echo "BUILD SEEMS TO BE BROCKEN"   2        echo "At least the test were not compiled"   P        echo "-----------------------------------------------------------------"           if [ ! $_FORCE_ -eq 1 ]           then   &            echo "Exit now with error"               exit 1   
        fi       fi           if [ $_TEST_ -eq 1 ]       then           ./tests/unit/cs_unit   *        ./tests/integration/cs_integration           ctest       fi       	    cd ..               if [ $_LINT_ -eq 1 ]       then           if [ -d ./pclint ]           then               rm -rf ./pclint   %            mkdir pclint && cd pclint   L            cmake .. && make lint && cat ./pclint/pclint-report.txt && cd ..   
        fi       fi           if [ $_COVERAGE_ -eq 1 ]       then           cd build   L        cmake -DCMAKE_BUILD_TYPE=Debug -DCRYPTOSERVICE_ENABLE_COVERAGE=ON ..   !        make coverage-report-html           make coverage-report           cd ..       fi           echo ""       echo " BUILD FINISHED "   }   
_main "$@"       P##### EOF ######################################################################5�_�                    �       ����                                                                                                                                                                                                                                                                                                                                                             `�j�     �   �   �              echo " BUILD FINISHED "5�_�                    �        ����                                                                                                                                                                                                                                                                                                                                                             `�j�     �   �   �           5�_�                     �       ����                                                                                                                                                                                                                                                                                                                                                             `�j�    �   �   �              echo ""5��