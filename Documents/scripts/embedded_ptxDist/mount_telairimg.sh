#!/bin/bash
#
################################################################################
#
#@author    Marco Israel (MI)
#@date      2020-01
#@authors   Last changed by:  Marco Israel - 2020.
#
#
#@brief     Mounts the partion inside the last telaiir image 2019 to /mnt/sdbX

#@attention This is only a dirty quick mount batch.
#           /mnt/sdbX must be already defined.
#
#@todo      Remove the hardcoded part to use it as general loop device mounting
#           script. It should autodetect the offset etc. by using fdisk and e.g.
#           ack/sed. Mount than the image from $1 to $2 using the values.
################################################################################


sudo mount -o loop,offset=65536 -t vfat ./telair_2019.img /mnt/sdb1
sudo mount -o loop,offset=210763776  ./telair_2019.img /mnt/sdb2
sudo mount -o loop,offset=525336576  ./telair_2019.img /mnt/sdb3
sudo mount -o loop,offset=840957952  ./telair_2019.img /mnt/sdb4
sudo mount -o loop,offset=2205155328  ./telair_2019.img /mnt/sdb5

########## EOF #################################################################
