#!/bin/bash
#
################################################################################
#
#@author    Marco Israel (MI)
#@date      2020-01
#@authors   Last changed by:  Marco Israel - 2020.
#
#
#@brief     Copy files to boot and rootfs partions. Clean it first if not.
#
#@attention All old files will get deleted if the partion is not empty.
#
#@todo -
################################################################################



################################################################################
### Functions
################################################################################


func__prepare_partions() {
    DRIVE=$1
    SRC=$2


    # Boot partion. Clean it first if not.
    sudo mount $DRIVE"2" /mnt
    sudo cp -r "$SRC"/rootfs/* /mnt/
    sudo umount /mnt

    sudo mount $DRIVE"3" /mnt
    sudo cp -r "$SRC"/data/* /mnt/
    sudo umount /mnt

    sudo mount $DRIVE"4" /mnt
    sudo cp -r "$SRC"/log/* /mnt/
    sudo umount /mnt


    sync

    sudo umount $DRIVE[1-5]

    echo "Finished"
}



################################################################################
### - MAIN - STARTING HERE
################################################################################

if [ "$#" -eq 2 ]
then
    if [ ! "$1" = "/dev/sda" ]
    then
        func__prepare_partions $1 $2
    fi

else
    echo "#####################################################################"
    echo ""
    echo "USAGE:"
    echo "${0##*/} <device-to-write-to>  [location-of-files-to-copy] "
    echo ""
    echo "#####################################################################"
fi


##### EOF ######################################################################


