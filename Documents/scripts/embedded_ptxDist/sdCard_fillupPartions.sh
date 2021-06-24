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

func__build_uImage() {
    SRC=$1

    if [ -f "$SRC"/linuximage ]
    then
        mv "$SRC"/linuximage "$SRC"/zImage
    fi

    if [ -f "$SRC"/zImage ]
    then
        mkimage -A arm -O linux -T kernel -C none -a 0x80008000 -e 0x80008000   \
              -n "Linux kernel" -d "$SRC"/zImage "$SRC"/uImage
    else
        echo "Neither an image called 'zImage' nor called 'linuximage' exists."
        echo "Exit now. Try to rebuild the Linux image".
        exit 1
    fi
}



func__clean_device() {
    DRIVE=$1

    if [ "$(ls -A "$DRIVE"'1')" ]
    then
        sudo rm -rf /mnt/*
    fi
}



func__prepare_partions() {
    DRIVE=$1
    if [[ $DRIVE == "sd"? ]]
    then
        DRIVE="/dev/$DRIVE"
    fi

    SRC="`pwd`/platform-MBa335x/images"

    if [ ! -z "$2" ]
    then
        SRC=$2
    fi


    # Boot partion. Clean it first if not.
    func__build_uImage $SRC
    sudo mount $DRIVE"1" /mnt
    func__clean_device $DRIVE
    sudo cp "$SRC"/MLO /mnt
    sudo cp "$SRC"/u-boot.img /mnt
    sudo cp "$SRC"/uImage /mnt
    sudo cp "$SRC"/zImage /mnt
    sudo cp "$SRC"/*.dtb /mnt
    ls -la /mnt/
    sudo umount /mnt



    # Rootfs partion. Clean it first if not.
    sudo mount "$DRIVE""2" /mnt
    func__clean_device $DRIVE
    sudo tar zxf "$SRC"/root.tgz -C /mnt
    ls -la /mnt/
    sudo umount /mnt

    sync
    echo "Finished"
}



################################################################################
### - MAIN - STARTING HERE
################################################################################

if [ "$#" -eq 1 ] || [ "$#" -eq 2 ]
then
    if [ ! "$1" == "/dev/sda" ] && [ ! "$1" == "sda" ]
    then
        func__prepare_partions $1 $2
    fi

else
    echo "#####################################################################"
    echo ""
    echo "USAGE:"
    echo "${0##*/} <device-to-write-to>  [<location-of-files-to-copy>]"
    echo "EXAMPLE:" "${0##*/} sdb "
    echo "EXAMPLE:" "${0##*/} sdb ~/app-folder "
    echo "EXAMPLE:" "${0##*/} /dev/sdb "
    echo "EXAMPLE:" "${0##*/} /dev/sdb ~/app-folder "
    echo ""
    echo "#####################################################################"
fi


##### EOF ######################################################################


