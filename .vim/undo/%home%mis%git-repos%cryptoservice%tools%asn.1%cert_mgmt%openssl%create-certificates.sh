Vim�UnDo�  H��rqSJX�(�c�Q0O�k"��&�r[52J   �                                   `x"�    _�                              ����                                                                                                                                                                                                                                                                                                                                                             `x"�    �               �   	#!/bin/sh   set -e   P################################################################################   # @brief    Script Help   P################################################################################   
_usage() {   
cat <<-EOF                   "${0##*/}"   P################################################################################       (@Author:    Matthias Nagel, Marco Israel   @Date:      2019-11-21   L@Brief      Generate PKI Key pairs and certificates by use of openssl tools.   I@detail     By default -when no parameters are given to this script - the   M            configuration files in the default folder called cnf will be used   O            generating a good-case example certifcate. If you like to use other   L            configuration files, put them in a dedicated folder and give the   N            folder name (and path) as input to this script (see example below)         USAGE:   ? "${0##*/}  [<path/config_folder>]  [ -v/--verbose, -h/--help ]   >    -v / --verbose  Keep the tempory and human readable files.   5                    By default they will be deleated.   "    -h / --help     Show this help       @example   &  Generate  good-case default example:    ${0##*/}   --verbose       G  Generate  certificates and keypairs with modified configuration files   / ${0##*/}   ~/<my_openssl_configs/this_config>/       P################################################################################   # END OF HELP.   EOF   }           P################################################################################   # @brief    Global variables   P################################################################################   DIR_CONFIG="openssl_configs"   DIR_KEY="output/private_keys"   DIR_CERT="output/certificates"   DIR_DBS="output/database"   DIR_HU="output/human_readables"       if [ $# -ge 1 ]   then   M    if [ ! "$1"  = "-v" ]  && [ ! "$1" = "--verbose" ]                      \   5        && [ ! "$1" = "-h" ] && [ ! "$1" = "--help" ]       then           DIR_CONFIG=$1       else           if [ $# -eq 2 ]               then                   DIR_CONFIG=$2   
        fi       fi   fi           P################################################################################   H# @brief    Do the magic. Generate the certificates to the output folder   P################################################################################   _generateCertificate() {       THIS=$1   	    CA=$2           echo ""   P    echo "====================================================================="   #    echo "Create $THIS certificate"   P    echo "====================================================================="       +    touch "$DIR_DBS/${BASE_NAME}-index.txt"       M    # ecparam:  Generates a private key key *.pen from an elliptic curve (EC)   L    openssl ecparam -name secp384r1 -genkey -noout -out "$DIR_KEY/$THIS.pem"       D    openssl ecparam -name secp384r1 -text -in "$DIR_KEY/$THIS".pem \        -out "$DIR_HU/$THIS.key.txt"       J    # req:  Creates certificate in PKCS#10 format and (or) can create self   @    #       signed certificates for use as root CAs for example.   <    openssl req -new -utf8 -config "$DIR_CONFIG/$THIS".cnf \   8    -key "$DIR_KEY/$THIS.pem" -out "$DIR_CERT/$THIS".pem       9    openssl req -text -verify -in "$DIR_CERT/$THIS".pem \        -out "$DIR_HU/$THIS.csr.txt"           if [ $THIS = $CA ]       then   9        # ca:   Sign ROOT certificate given by the input.   M        # The self signed root CA certificate needs to include the extensions   N        openssl ca -batch -utf8 -config "$DIR_CONFIG/$CA.cnf" -create_serial \   7        -extensions self_issued_extensions -selfsign  \   M        -verbose -in "$DIR_CERT/$THIS.pem" -notext -out "$DIR_CERT/$THIS.pem"           else   9        # ca:   Sign USER certificate given by the input.   N        openssl ca -batch -utf8 -config "$DIR_CONFIG/$CA.cnf" -create_serial \   M        -verbose -in "$DIR_CERT/$THIS.pem" -notext -out "$DIR_CERT/$THIS.pem"       fi       ,    openssl x509 -in "$DIR_CERT/$THIS.pem" \   +    -outform DER -out "$DIR_CERT/$THIS.der"           >    openssl x509 -text -inform der -in "$DIR_CERT/$THIS.der" \   !    -out "$DIR_HU/$THIS.cert.txt"       P    echo "====================================================================="   }           P################################################################################   *# @brief    Create the root CA certificate   P################################################################################   # Create Root CA certificate   _createCA_root() {       BASE_NAME="root-ca-1"       CACONF_FILE="${BASE_NAME}"       0    _generateCertificate $BASE_NAME $CACONF_FILE   }           P################################################################################   )# @brief    Create the sub CA certificate   P################################################################################   _createCA_sub() {       # Create Sub CA certificate       BASE_NAME="sub-ca-1"       CACONF_FILE="root-ca-1"   0    _generateCertificate $BASE_NAME $CACONF_FILE   }           P################################################################################   0# @brief    Create the subscriber CA certificate   P################################################################################   _createCA_subscriber() {   %    # Create a subscriber certificate       BASE_NAME="subscriber-1"       CACONF_FILE="sub-ca-1"       0    _generateCertificate $BASE_NAME $CACONF_FILE   }           P################################################################################   # @brief    MAIN   P################################################################################   	_main() {   C    if [ "$1" = "--help" ] || [ "$1" = "-h" ] || [ "$1" = "-help" ]       then           _usage       else           if [ -d output ]           then               rm -rf output   
        fi               mkdir -p $DIR_KEY           mkdir -p $DIR_DBS           mkdir -p $DIR_CERT           mkdir -p $DIR_HU               _createCA_root               _createCA_sub               _createCA_subscriber       M        if [ ! "$1" = "-v" ]                                                \   M            && [ ! "$1" = "--verbose" ]                                     \   M            && [ ! "$2" = "-v" ]                                            \   '            && [ ! "$2" = "--verbose" ]           then               rm -rf $DIR_HU               rm -rf $DIR_DBS   
        fi       fi   }   _main $1 $2       P### EOF ########################################################################5��