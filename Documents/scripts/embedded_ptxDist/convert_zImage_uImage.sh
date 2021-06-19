#!/bin/bash
#
################################################################################
#
#@author    Marco Israel (MI)
#@date      2020-01
#@authors   Last changed by:  Marco Israel - 2020.
#
#
#@brief     Builds an u-boot uImage from an zImage.
#@details   The bootloader u-boot needs an zImage with some additional header
#           information. Thats why it looks for an uImage which is such an
#           zImage with the additional information.
#
################################################################################

if [ "$#" -gt 1 ]
then

    destination="./"


    if [ $# ]
    then
          destination="$2"
    fi


    mkimage -A arm -O linux -T kernel -C none -a 0x80008000 -e 0x80008000   \
        -n "Linux kernel" -d $1 $destination/uImage

else
    echo "USAGE:"
    echo "$0   <path-to-source>/<zImage>   [<path-to-destination>]"
fi

##### EOF ######################################################################
