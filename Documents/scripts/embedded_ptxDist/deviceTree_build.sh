
#!/bin/bash
#
################################################################################
#
#@author    Marco Israel (MI)
#@date      2020-01
#@authors   Last changed by:  Marco Israel - 2020-01.
#
#
#@brief     Builds a device tree from sources and includes
#@details   First resolve the includes macros and so on  be using the GNU GCC
#           preprocessor. Afterwards compile everything first into a new combine
#
#@todo      Remove the hardcoded path
################################################################################


cd "/ptxdist/projects/TQMaxx.BSP.SW.REV.0119/TQMaxx.BSP.SW.SRC.0119/"
cd "platform-MBa335x/build-target/linux-4.4/arch/arm/boot/dts/"


DTC="../../../../scripts/dtc/dtc"
GCC="gcc"



$GCC -I./                                                               \
     -I include/                                                        \
     -E -nostdinc                                                       \
     -undef                                                             \
     -D__DTS__                                                          \
     -x assembler-with-cpp                                              \
     -o $2.dts.tmp                                                      \
         $1.dts

$DTC -I dts                                                             \
     -O dts                                                             \
     -o ~/$2.dts                                                        \
        $2.dts.tmp


#mv $2.dts.tmp /tmp/



$DTC -I dts                                                             \
    -O dtb                                                              \
    -o ~/$2.dtb                                                         \
        ~/$2.dts


########## EOF #################################################################
