#!/bin/bash

################################################################################
# @brief    Global Variable. **THIS NEED TO BE SET**
################################################################################
_PRJ_ROOT_=$(git rev-parse --show-toplevel)

_CREATE_CERTIFICATES_="${_PRJ_ROOT_}/external/cert_mgmt/openssl/create-certificates.sh"
_OPENSSL_CONFIGS_="${_PRJ_ROOT_}/external/cert_mgmt/openssl/openssl_configs"


################################################################################
# @brief    Print the help according to this script
################################################################################
_usage() {
cat <<-EOF
                "${0##*/}"
################################################################################

@author     Marco Israel (MI)
@date       2021
@brief      Generate a certificate test folder and run the creation script.
@detail     If the testfolder and testcase already exists, the script will only
            Execute the test. In both cases:
            - the results will be copied into the testcase folder called output
            - The compiler log file will be saved into the outpudfolder
            - Beside the keys and certificates also a human readable certificate
              is placed into the output/hu folder
            - The testlist README file will gets open so you can update it
            - The new tree or changed files will be commited to git finally

 @attention   ***ATTENTION*** Global variable needs to to be configured manual:
                            * _CREATE_CERTIFICATES_ The script to create the
                                                    certificates by openssl.
                            * _OPENSSL_CONFIGS_     The folder path to the
                                                    openssl working files.


  USAGE:
 ${0##*/} <testName>/<testCase> [ -n , -r, -a, -h ]
    -n / --noOutput      Don't store the result output in the testcase folder.
    -v / --verbose       Keep human readable output as well as tempory data
    -r / --removeOutput  Remove the output folders out of the testcase folders.
    -a / --all           Generate the output for all testcases. The output will
                         be stored by default in the testcase folder.
                         Combind with -n is a dry-run. Combind with -s / --split
                         will extract the output into a seperated result folder.
    -s / --split         Don't store the generated certificates output within
                         the OpenSSL configuration folder but in a seperated
                         release folder. In other words it will splitt / extract
                         the generated certificates from the its correspondig
                         configuration. The output folder is no longer located
                         in the testcase folder (wich is the default without
                         this flag) but can now be found in a seperated
                         release folder.
    -e / --extract       Same as -s / --split but copies the generated
      [<path>/<folder>]  certificates to a given destion by holding the same
                         foldertree inside. Run -d /--remremoveOutput afterwards
                         will resul in the same final state like generating the
                         certificates with -a / -all with -s / --split which
                         will deleate the certificates in the old destion.
    -h / --help          Show this help.

 @example
        # Generate one single testcase
    ${0##*/} <output_path>/1.2.3.4_requirement/1_test_case -n

        # Generate all testcase with human_readables and database verbose output
    ${0##*/} -a -v

        # Remove alle output folders in all testcases
    ${0##*/} -r

        # Extract the certificates after generation from the testcase folder
        # into an seprated folder (-r) Ih holds the same folderstructure inside
        # like the correspondig configuration files.
    ${0##*/} -e [ <path>/<foldername> ]

        # The same like -e with -d but extact (split) the results directly
        # during the generation (of all files) into a seperated folder.
    ${0##*/} -a -s



################################################################################
# END OF HELP.
EOF
}


################################################################################
# @brief    Generate a README testlist template file in the root testcase folder
################################################################################
_gen_readme() {
cat <<-EOF > "$1/$2"/README.md
# TEST
# $1
--------------------------------------------------------------------------------
## REQUIRED SCOPE:

1.
TODO the kind to test out of the required text part.


--------------------------------------------------------------------------------
## TESTLIST:

### 1_TODO_test_name
TODO Test description. E.g. what is the test defining in configuration files.

--------------------------------------------------------------------------------
EOF
}



################################################################################
# @brief    Create a testcase or run it if it already exists
################################################################################
_output_handler() {
    SOURCE="./output"
    DESTINATION=$1
    FLAGS=$2


    if [ -d "${DESTINATION}/output" ]
    then
        rm -rf "${DESTINATION}/output"
    fi

    if [ ! "$FLAGS" = "--noOutput" ]                                        \
    && [ ! "$FLAGS" = "-n" ]                                                \
    && [ ! "$FLAGS" = "--removeAllOutput" ]
    then
        if [ -f ./tmp.log ]
        then
            if [ "$FLAGS" = "-v" ] || [ "$FLAGS" = "--verbose" ]
            then
                mv ./tmp.log "${SOURCE}"/compiler.log
            else
                rm ./tmp.log
                if [ -d "${SOURCE}"/human_readables ]
                then
                    rm -rf "${SOURCE}"/human_readables
                fi
                if [ -d  "${SOURCE}"/database ]
                then
                    rm -rf "${SOURCE}"/database
                fi
            fi
        fi

        mv "${SOURCE}" "${DESTINATION}"

    else
        if [ -d "${SOURCE}" ]
        then
            rm -rf "${SOURCE}"
        fi

        if [ -f ./tmp.log ]
        then
            rm ./tmp.log
        fi
    fi
}



################################################################################
# @brief    Create a testcase or run it if it already exists
################################################################################
_gen_test_case() {
    TEST_CASE="$1"
    GIT_LOG_TAG="WIP"
    FLAGS=$2
    TEMPLATE_FOLDER=$3

    if [ ! -d "$TEST_CASE" ]
    then
        echo "NEW REQUIRED TESTCASE"
        mkdir -p "$TEST_CASE"
        _gen_readme "$TEST_CASE/.."

        sed  -i "s/inputdir = openssl_configs/inputdir = ${TEST_CASE}/g"    \
        $DIR_CONFIG/root-ca-1.cnf
        sed  -i "s/inputdir = openssl_configs/inputdir = ${TEST_CASE}/g"    \
        $DIR_CONFIG/sup-ca-1.cnf

        for FILE in $TEMPLATE_FOLDER/*
        do
            if [ -f $FILE ]
            then
                cp $FILE "$TEST_CASE/"
            fi
        done
        git checkout $TEMPLATE_FOLDER
        GIT_LOG_TAG="INIT"
    fi

    "${_CREATE_CERTIFICATES_}" "$TEST_CASE" "$FLAGS" 1> ./tmp.log 2>&1
    cat ./tmp.log

    _output_handler "$TEST_CASE" "$FLAGS"

    vim "$TEST_CASE/../README"
    git add "$TEST_CASE/../README"
    for FILE in $TEST_CASE/*
    do
        if [ -f $FILE ]
        then
            git add $FILE
        fi
    done

    git commit "$TEST_CASE" -m "$GIT_LOG_TAG TEST [$TEST_CASE]"
}



################################################################################
# @brief    Delete or Generate output in all existing tests in the given folder
################################################################################
_handle_all_tests() {
    TEST_FOLDER=$1
    FLAGS=$2
    for FOLDER in $TEST_FOLDER/*
    do
        if [ -d $FOLDER ]
        then
            for TEST_CASE in $FOLDER/*
            do
                if [ -d $TEST_CASE ]
                then
                    if [ ! "$FLAGS" = "--removeAllOutput" ]
                    then
                        echo "Regenerating $TEST_CASE"
                        "${_CREATE_CERTIFICATES_}" "$TEST_CASE" "$FLAGS"    \
                        1> ./tmp.log 2>&1

                    fi
                    _output_handler $TEST_CASE $FLAGS
                else
                    continue
                fi
            done
        else
            continue
        fi
    done

    if [ "$FLAGS" = "-s" ] || [ "$FLAGS" = "--split" ]
    then
        ./create-test-certificates.sh --extract --removeAllOutput
    fi
}


################################################################################
# @brief    Extract the result output folders
################################################################################
_extract_output_certificates() {
    echo "Extracted to $3"
    find $4 -name output -type d -print0 | xargs -0 -I {}                   \
    mkdir -p "$3"/{}

    find $4 -name output -type d -print0 | xargs -0 -I {}                   \
    cp -r {} "$3"/{}/..

    if [ "$1" = "--removeAllOutput" ] || [ "$1" = "-r" ]                \
    || [ "$2" = "--removeAllOutput" ] || [ "$2" = "-r" ]
    then
        find $OUTPUT_FOLDER -name output -type d -print0                \
        | xargs -0 rm -rf
    fi
}


################################################################################
# @brief    Script MAIN
################################################################################
_main() {
    INPUT_FOLDER="${_OPENSSL_CONFIGS_}"
    OUTPUT_FOLDER=./tests
    OUTPUT_FOLDER_EXTRACTED=./release

    if [ "$#" -ge  1 ] && [ "$#" -le 2 ]                                    \
    && [ ! "$1" = "-h" ] && [ ! "$1" = "--help" ]
    then

        if [ ! -f "${_CREATE_CERTIFICATES_}" ]
        then
            echo "The script to generate the certificates was not found"
            echo "You may need to checkout the git cert_mgmt submodule repo"
            exit 1
        fi

        if [ -d  "$OUTPUT_FOLDER_EXTRACTED" ]
        then
            rm -rf "$OUTPUT_FOLDER_EXTRACTED"
        fi

        if [ "$1" = "--all" ] || [ "$1" = "-a" ]                            \
        || [ "$2" = "--all" ] || [ "$2" = "-a" ]
        then
            _handle_all_tests "$OUTPUT_FOLDER" $2
        elif [ "$1" = "--removeAllOutput" ] || [ "$1" = "-r" ]
        then
            rm -rf  "$OUTPUT_FOLDER_EXTRACTED"
            _handle_all_tests "$OUTPUT_FOLDER" "--removeAllOutput"
        elif [ "$1" = "--extract" ] || [ "$1" = "-e" ]
        then
            if [ ! "$2" = "" ]
            then
                OUTPUT_FOLDER_EXTRACTED="$2"
            fi

            _extract_output_certificates "$1" "$2" "$OUTPUT_FOLDER_EXTRACTED" "$OUTPUT_FOLDER"

        else
            _gen_test_case "$1" "$2" "$INPUT_FOLDER"
        fi
    else
        _usage
    fi
}
_main $1 $2

### EOF ########################################################################
