#!/bin/bash
#
################################################################################
#
#@author    Marco Israel (MI)
#@date      2020-01
#@authors   Last changed by:  Marco Israel - 2020.
#
#
#@brief     Builds a device tree blob or source from sources.
#
################################################################################

if [ "$#" -gt 2 ]
then


	INPUT=$1
	OUTPUT=$2

    shift
    shift


    gcc -I./ -I include/ -E -nostdinc -undef -D__DTS__ -x assembler-with-cpp  \
        -o tmp.dts $INPUT


	while test $# -gt 0

	do
	    case "$1" in
	        -dtb) dtc -I dts -O dtb tmp.dts -o $OUTPUT.dtb
	            ;;
	        -dts) dtc -I dts -O dts tmp.dts -o $OUTPUT.dts
	            ;;
	        -rmtmp) rm tmp.dts
	            ;;
	    esac
	    shift
	done




else
    echo "#####################################################################"
    echo ""
    echo "USAGE:"
    echo "${0##*/} <inputPath/input.dts > <outputPath/outputNameOnly "
    echo "											[<-dtb>]  [<-dts>] [<-rm>]"
    echo ""
    echo "#####################################################################"
fi

##### EOF ######################################################################
