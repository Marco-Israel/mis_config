#!/bin/bash


_usage() {
cat <<-EOF

################################################################################
                "${0##*/}"
################################################################################

@author    Marco Israel (MI)
@date      2020-01
@authors   Last changed by:  Marco Israel - 2020.


@brief     Build an ready to use SDCard/HDD/MMC image

@detail:
  Builds an SDCard/HDD/MMC image with different partions and prepare it
  with the needed conten. Note e2fsprogs with an realease after yar 2020
    required.


 USAGE:
 "${0##*/} -p <label:type:size:conten_source>  [-p <...>]  [-o <outpath/name>]"

 -p    Create a new partion. MUST at least given once; CAN be used multiple
       times. The parts between : will be interpreted as follows:
           label:  Name of the partion to create
           type:   Partion type to create. See man mke2fs
           size:   Size of the new partion in MiB (Mebibytes)
           content_source:     Optional. Content to copy into the partion root.

 -o    Outputpatch and name where to create the image with name.

 -d     Build a development sdCard with additional tools in the rootfs for
        debuging and development if such an rootfs was provided before.
        NOTE: No parameter is repuired for this option.

 -h    Show this help.

@example:  Create an image with two partions at a given location. Copy files
           files into the first one directly.

           user@machine: thisSrcipt.sh -p part1:ext2:47:/tmp/someDir
                               \ -p part1:ext2:47
                               \ -o /tmp/out.img

@note:     Currently the partion size can only be in unit 'MiB' (Mebibytes).

################################################################################
# END OF HELP.
EOF
}


################################################################################
#File Global Variables
declare _PATH_OUT="./misImage.img"
declare -i _PARTION_COUNT=0
declare -i _INODEMULTIPLYER=2
declare -a _PARTION_LABEL=""
declare -a _PARTION_TYPE=""
declare -a _PARTION_SIZE=""
declare -a _PARTION_CONTENT_SOURCE=""
declare -i _PARTION_TABLE_SIZE=63
declare -i _IMAGE_BLOCK_SIZE=512


################################################################################
#Local Functions

_getImagesize () {
    local -i SIZE_IMAGE=0
    for i in ${_PARTION_SIZE[*]}
    do
        SIZE_IMAGE=$((${SIZE_IMAGE}+$i))
    done

    echo $SIZE_IMAGE
}


_creatPartion () {
# Parameters are as follows :
# $1 == PARTION_ID          (Int)
# $2 == SECTOR_START        (Int)
# $3 == PARTION_BOOTFLAG    ("bootable" or left empty)

    local TYP="NONE"

    case "${_PARTION_TYPE[$1]}" in
        ext2 | ext3 | ext4 )
            TYP="83"
            ;;
        vfat | fat | fat32 | dos )
            TYP="c"
            ;;
         * )
             echo ""
             echo "File system TYPE NOT SUPPORTED"
             echo "Scripts exists now with error"
             echo ""
             _usage
             exit 1
             ;;
        esac

        sfdisk -N $(( $1==0 ? $1 : $1 +1 )) $_PATH_OUT <<-EOF
start=$2, size=${_PARTION_SIZE[$1]}, type=$TYP, name="${_PARTION_LABEL[$1]}", $3
EOF
}


_createFilesystem () {
    local TMPIMG=".mistmpFS.img"
    local -i TMPOFFSET=${_PARTION_TABLE_SIZE}

    for (( PID=0; PID<${_PARTION_COUNT}; ++PID )); do

        dd if=/dev/zero of="${TMPIMG}"                                         \
            bs=${_IMAGE_BLOCK_SIZE} count=${_PARTION_SIZE[$PID]}

        case "${_PARTION_TYPE[$PID]}" in
            ext2 | ext3 | ext4 )

            local -i EXTBLOCKSIZE=1024
            local -i INOUTCOUNT=128
            sudo /usr/local/sbin/sumke2fs -d ${_PARTION_CONTENT_SOURCE[$PID]}  \
                -t ${_PARTION_TYPE[$PID]} -L "${_PARTION_LABEL[$PID]}" -m 1    \
                -N $(( ${_PARTION_SIZE[$PID]} /100 * _INODEMULTIPLYER)) -I 128 \
                -b ${EXTBLOCKSIZE} ${TMPIMG} $(( ${_PARTION_SIZE[$PID]} /      \
                ${EXTBLOCKSIZE} * ${_IMAGE_BLOCK_SIZE} ))
                ;;
            vfat | fat | fat32 | dos )

                mkfs.vfat -S ${_IMAGE_BLOCK_SIZE} -n ${_PARTION_LABEL[$PID]}   \
                     "${TMPIMG}"

                    IFS='{,}'
                    read -ra INPUT <<<"${_PARTION_CONTENT_SOURCE[$PID]}";

                    for (( FID=1; FID<$((${#INPUT[@]})); ++FID ))
                    do
                        if [ -d ${INPUT[0]}${INPUT[$PID]} ]
                        then
                         mcopy -s -i "${TMPIMG}" ${INPUT[0]}${INPUT[$FID]}/* ::/
                        else
                         mcopy -i "${TMPIMG}" ${INPUT[0]}${INPUT[$FID]} ::/
                        fi
                    done
                unset INPUT
                ;;
        esac

       dd if=${TMPIMG} of=${_PATH_OUT} bs=${_IMAGE_BLOCK_SIZE} conv=notrunc    \
            count=${_PARTION_SIZE[$PID]} seek=${TMPOFFSET}

        ((TMPOFFSET+=${_PARTION_SIZE[$PID]} ))

        rm -f "${TMPIMG}" 2>/dev/zero
    done
}


_createImage () {
    local -i SIZE_IMAGE=$(_getImagesize)
    local -i OFFSET_START=${_PARTION_TABLE_SIZE}


    dd if=/dev/zero of="${_PATH_OUT}" bs=${_IMAGE_BLOCK_SIZE}                  \
        count=$(( $SIZE_IMAGE + ${_PARTION_TABLE_SIZE} ))


    _creatPartion 0 ${OFFSET_START} bootable


   ((OFFSET_START+=${_PARTION_SIZE[0]}))

    for ((PID=1; PID<${_PARTION_COUNT}; ++PID))
    do
        _creatPartion ${PID} ${OFFSET_START}

        (( OFFSET_START+=${_PARTION_SIZE[$PID]} ))
    done
}


_printPartions () {
    for (( PID=0; PID<${_PARTION_COUNT}; ++PID)); do
        echo "-----------------"
        echo "ID:       $PID"
        echo "Label:    ${_PARTION_LABEL[$PID]}"
        echo "Type:     ${_PARTION_TYPE[$PID]}"
        echo "Size:     $(( ${_PARTION_SIZE[$PID]} / 2**11 ))"
        echo "Source:   ${_PARTION_CONTENT_SOURCE[$PID]}"
        echo "-----------------"
    done
}


_extractPartionValues () {
    local tmpIFS=$IFS
    IFS=':' read -ra INPUT <<<"$1"
    IFS=$tmpIFS

    if [ ${_PARTION_COUNT} -eq 0 ]
    then
        _PARTION_LABEL=${INPUT[0]}
        _PARTION_TYPE=${INPUT[1]}
        _PARTION_SIZE=$(( ${INPUT[2]} * 2**11 ))
        _PARTION_CONTENT_SOURCE=${INPUT[3]}
    else
        _PARTION_LABEL+=(${INPUT[0]})
        _PARTION_TYPE+=(${INPUT[1]})
        _PARTION_SIZE+=( $(( ${INPUT[2]} * 2**11 )) )
        _PARTION_CONTENT_SOURCE+=(${INPUT[3]})
    fi

    (( _PARTION_COUNT++ ))
}


_setDefaultOps () {
    local -i FAK=$((2**11))
    _PATH_OUT="platform-MBa335x/images/telair-cp790760.img"
    _PARTION_COUNT=4
    _PARTION_LABEL=( BOOT ROOTF DATA LOG )
    _PARTION_TYPE=( vfat ext3 vfat vfat )
    _PARTION_SIZE=( $((7 * $FAK)) $((380 * $FAK)) $((2 * $FAK)) $((1 * $FAK)) )
    _PARTION_CONTENT_SOURCE=(                                                  \
     "platform-MBa335x/images/{zImage,u-boot.img,MLO,telair-am335x.dtb}"       \
     "platform-MBa335x/root-minimal"                                           \
     "local_src/telair-partion-files/partion-data/{files}"                     \
     "local_src/telair-partion-files/partion-log/{files}" )
    _PARTION_TABLE_SIZE=63
    _IMAGE_BLOCK_SIZE=512
}


_setDevelopentOps () {
    echo "TEST"
    local -i FAK=$((2**11))
    _PATH_OUT="platform-MBa335x/images/telair-cp790760.img"
    _PARTION_COUNT=4
    _INODEMULTIPLYER=10
    _PARTION_LABEL=( BOOT ROOTF DATA LOG )
    _PARTION_TYPE=( vfat ext3 vfat vfat )
    _PARTION_SIZE=( $((7 * $FAK)) $((400 * $FAK)) $((2 * $FAK)) $((1 * $FAK)) )
    _PARTION_CONTENT_SOURCE=(                                                  \
     "platform-MBa335x/images/{zImage,u-boot.img,MLO,telair-am335x.dtb}"       \
     "platform-MBa335x/root-development"                                       \
     "local_src/telair-partion-files/partion-data/{files}"                     \
     "local_src/telair-partion-files/partion-log/{files}" )
    _PARTION_TABLE_SIZE=63
    _IMAGE_BLOCK_SIZE=512
}




_getOpts () {
    while getopts "h:o:p:" OPT
     do
         case "${OPT}" in
             o)
                 _PATH_OUT=${OPTARG}
                 ;;
             p)
                 _extractPartionValues ${OPTARG}
                 ;;
             *)
                 if [[ "${1}" == "-d" ]]
                 then
                    _setDevelopentOps
                 else
                 _usage
                 fi
                 ;;
         esac
    done
    shift $((OPTIND -1))
}


##### MAIN #####################################################################

if [ ! "$1" == "help" ] || [ "$#" -eq 0 ]
then

    _getOpts "$@"

    if [ ${_PARTION_COUNT} -eq 0 ]
    then
        _setDefaultOps
    fi

    _printPartions
    _createImage
    _createFilesystem

else
   _usage

fi

##### EOF ######################################################################
