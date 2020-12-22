#!/bin/bash
#
################################################################################
#
#@author    Marco Israel (MI)
#@date      2020-01
#@authors   Last changed by:  Marco Israel - 2020.
#
#
#@brief     Script to build and format a bootable (linux) SD Card
#@details   Requirement: Only standard GNU-Core tools are required:
#           fdisk, mkfs.*, mount,  echo, dd
#           Tested on Ubuntu 14.04
#
################################################################################


#As less the driver block device is needed.
if [ $# -ge 1 ]
then

    #check if not sda should be written
    if [ ! "$1" = "/dev/sda" ]
    then


        DRIVE=$1


        #Check if given sdaX device is an available blockdive.
        if [ -b "$DRIVE" ]
        then


            # Unmount driver if currently in use
            sudo umount $DRIVE[1-4]


            #Force English output
            unset LANG


            # Default partion type.
            # NOTE: The Values are optimized to an even number of sector.
            # This fits totally in less than 100 MB of overall size in Memory
            # for the bootloader, an linux kernel image and an uncompressed
            # busybox rootfs.
            SIZE_PARTION_BOOT="16MB"
            SIZE_PARTION_ROOTFS="98MB"
            SIZE_PARTION_APP_DATA="98MB"
            SIZE_PARTION_LOG="34MB"
            #SIZE_PARTION_BACKUP="13MB"


            # Use partion size from user input. Otherwise use default values.
            if [ $2 ]
            then
                SIZE_PARTION_BOOT=$1
            fi

            if [ $3 ]
            then
                SIZE_PARTION_ROOTFS=$3
            fi


            # This is the fdisk command stream.
            # It create and write a new partion layout.
            # ATTENTION:    Don't touch it. The blank lines are needed e.g.
            # NOTE:         Maximum of allowed primary partions are 4
            FDISK_CMD="
            n
            p
            1

            +$SIZE_PARTION_BOOT
            t
            c
            n
            p
            2

            +$SIZE_PARTION_ROOTFS
            n
            p
            3

            +$SIZE_PARTION_APP_DATA
            t
            3
            c
            n
            p
            4

            +$SIZE_PARTION_LOG
            t
            4
            c
            a
            1
            w
            "


            # Partions must be unmounted before change and format them.
            umount $DRIVE"1"
            umount $DRIVE"2"


            # Overwrite the old partion table; it is located in the first sector
            # Doing this marks the device as empty.
            dd if=/dev/zero of=$DRIVE bs=1024 count=1024


            # The above stream commands is used as input for fdisk.
            # Its meaning (line by line is as follows:
                # 1:    Start a process to define a new partion.
                # 2:    The partion should be primary.
                # 3:    Set the partion number.
                # 4:    <CR>: Use the default value as start sector (2048).
                # 5:    define the end sector aka. the size of this partion.
                # 6:    Start the process to change the partion type.
                # 7:    Change the default partion type (Linux) to FAT32 LEP.
                # 8:    Start a process to define a new partion.
                # 9:    The partion should be primary.
                # 10:   Set the partion number.
                # 11:   <CR>: Use the default value as start sector.
                # 12:   define the end sector aka. the size of this partion.
                #       [...] same for other partions [...]
                # 13:   Start a process to define a the boot partion.
                # 14:   Select the first partion as boot partion.
                # 15:   Burn the partion scheme to device; overwrite the old.
            echo "$FDISK_CMD" | fdisk /dev/sdb


            # Format the partions with the needed Filesystem.
            # ATTENTION:    vFAT for Boot is required!
            # NOTE:     Here we use an FAT12 type with 8 sectors per cluster
            # where a cluster must contain 512 sectors. This configuration is
            # used to hold the boot sector as small as possible while using FAT
            # as the needed bootloader filesystem.
            mkfs.vfat -F 12 -s 8 -S 512 -c -n "boot" ${DRIVE}1
            #mke2fs -j -I 128 -i 1024 -b 1024 -T small -L "rootfs" ${DRIVE}2
            mke2fs -j -t ext4 -T small -L "rootfs" ${DRIVE}2
            #mke2fs -j -t vfat -T small -L "data" ${DRIVE}3
            #mke2fs -j -t vfat -T small -L "log" ${DRIVE}4
            mkfs.vfat -c -n "data" ${DRIVE}3
            mkfs.vfat -c -n "log" ${DRIVE}4


            #The final result:
            echo""
            echo "#############################################################"
            echo""
            fdisk -l /dev/sdb
            echo "#############################################################"


        else
            echo ""
            echo "#############################################################"
            echo ""
            echo "The target device needs to be a block oriented device".
            echo "Exit"
            echo ""
            echo "#############################################################"
            echo ""
        fi


    else
        echo ""
        echo "#################################################################"
        echo ""
        echo "ERROR WRONG USAGE"
        echo "NEVER EVER use your local harddisk sda !"
        echo "Exit"
        echo ""
        echo "USAGE:"
        echo "$0 <path/device !=sda>  [<sizeof-partion1>]  [<sizeof-partion2>]"
        echo ""
        echo "#################################################################"
        echo ""
    fi


else
    echo "#####################################################################"
    echo ""
    echo "USAGE:"
    echo "${0##*/} <path>/<device !=sda>  [<size-partion1>]  [<size-partion2>]"
    echo ""
    echo "#####################################################################"
fi


#################### EOF #######################################################
