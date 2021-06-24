#!/bin/bash
#
################################################################################
#
#@author    Marco Israel (MI)
#@date      2020-01
#@authors   Last changed by:  Marco Israel - 2020.
#
#
#@brief     This tool is a little wrapper to mount loop devices like local *.img
#@details   This helps to mount loop devices. Such a dive can be a local image
#           created by dd. There is at least on partion in the image. But it is
#           also possinle to mount single ones inside the the image if there are
#           more than ones. Same as like /dev/sdb /dev/sdb1 /dev/sdb2 ...
#
#@todo      - Autodedect the Sector size by help of fdisk -l and than filter the
#               output for the sectorzize.
#           - If possible, autodetect the filesystemtype.
#
################################################################################

if [ "$#" -gt 1 ]
then

    LOOPDEVICE="$1"
    MOUNTPOINT="$2"
    FILESYSTEMTYPE="$3"
    SECTOR_SIZE=$4
    PARTION_STARTSECTOR=($SECTOR_SIZE*$5)
    PARTION_SIZE=($SECTOR_SIZE*$6)



    sudo mount -o loop,offset=$PARTION_STARTSECTOR sizelimit=$PARTION_SIZE \
     $LOOPDEVICE $MOUNTPOINT




else
    echo "#####################################################################"
    echo ""
    echo "USAGE:"
    echo "${0##*/} <loopdev-to-mount>  <mountpoint-where-to-mount> ...
    ... <filesystem-type> <sector-size> <start-sector> <partion-size>"
    echo ""
    echo "fdisk -l <loopdev-to-mount>" will show you the needed information.
    echo ""
    echo "#####################################################################"
fi

##### EOF ######################################################################
