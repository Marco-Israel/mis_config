#!/bin/sh
#
################################################################################
#
#@author    Marco Israel (MI)
#@date      2020-06
#@authors   Last changed by:  Marco Israel - 2020.
#
#
#@brief     Installs dependencies and configures the system at first boot.
#@details   This script gets executed at first boot of the system by 'inittab'
#           It extracts data files to other partions and configures the system
#           like modifying the fstab or adds user permitions.
#
#@attention    NOTE/ATTENTION: THIS SCRIPT REMOVES ITSELF AFTER FIRST EXECUTION!
#
################################################################################


### install ###
mount -o remount,rw /dev/mmcblk0p3 /data
mount -o remount,rw /dev/mmcblk0p4 /log

tar -xzvf /dataFiles.tar.gz -C /data/
tar -xzvf /logsFiles.tar.gz -C /log/


### configuration ###
echo "console:4:once:/home/telair_appl.sh" >> /etc/inittab


echo \
'root:$6$ADkQIwq8$86upSvMcr/KBSm4VQU/t5hMy30A9FqhQH7zx8ihh3Ja4IHISCH39SzbNH9swg3Pb/hTdVZA3xFHNJza4Bnczm.' \
    | chpasswd --encrypted


### cleanup ###
sed '/DELEAT/,+2 d' /etc/inittab >> /tmp/inittab
mv /tmp/inittab /etc/inittab
rm /dataFiles.tar.gz
rm /logsFiles.tar.gz
rm /system_setup.sh


### finsh ###
reboot


### exit ###
#prevent a /etc/inttab respawn
sleep 10
exit 0


### EOF ########################################################################

