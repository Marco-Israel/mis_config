
#!/bin/bash


_usage() {
cat <<-EOF

                "${0##*/}"
################################################################################

@author    Marco Israel (MIs)
@date      2020-07
@authors   Last changed by:  Marco Israel - 2020.


@brief     A wrapper to Linux dd. It copies bytewise to/from an hard drive.

@details
 USAGE:
 "${0##*/} <path/SOURCE> <path/DESTINATION>


@example
    1:
  "${0##*/} /tmp/someImge.img /dev/sdb

    2:
  "${0##*/} /tmp/someImge.img sdb

    3:
  "${0##*/} sdb /tmp/myImage.img

    4:
  "${0##*/} -o sdb -i /tmp/myImage.img

    5:
  "${0##*/} -h
        <show this help>


@copyright     Available under the MIT License.

                Copyright (C) 2020 Marco Israel (MI).       All rights reserved.

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
the Software, and to permit persons to whom the Software is furnished to do so,
subject to the following conditions:

The above copyright notice and this permission notice shall and MUST BE
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

################################################################################
# END OF HELP.
EOF
}


################################################################################
#File Global Variables

declare DRIVE1="unset"
declare DRIVE2="unset"

################################################################################
#Local Functions

_checkDevice () {

    #check if not sda should be written
    if [ "$1" == "/dev/sda" ] || [ "$1" == "sda" ]
    then
        echo "Dont use your computers Hardware sda to copy from/to!."
        _usage
        echo "EXIT NOW"
        exit 1
    else
        return 0
    fi


}

_getOpts () {

    while [ $# -gt 0 ]
    do
        case "$1" in

             "sd"? | "/dev/sd"? )
                _checkDevice "$1"

                if [[ ! ${DRIVE1} == "/dev/sd"? ]]
                then
                    DRIVE1="$1"
                    if [[ ${DRIVE1} == "sd"? ]]
                    then
                        DRIVE1="/dev/""${DRIVE1}"
                    fi
                elif [[ ! ${DRIVE2} == "/dev/sd"? ]]
                then
                    DRIVE2="$1"
                    if [[ ${DRIVE2} == "sd"? ]]
                    then
                        DRIVE2="/dev/""${DRIVE2}"
                    fi
                fi
                shift
                ;;
            "--if" )
                shift
                DRIVE1="$1"
                ;;
            "--of")
                shift
                DRIVE2="$1"
                _checkDevice "$DRIVE2"
                if [[ ${DRIVE2} == "sd"? ]]
                then
                    DRIVE2="/dev/""${DRIVE2}"
                fi
                ;;
            *) _usage
                ;;
        esac
        shift
    done
}

##### MAIN #####################################################################

    #check if not sda should be written

        _getOpts "$@"

        sudo umount ${DRIVE1} 2>/dev/zero
        sudo umount ${DRIVE2} 2>/dev/zero

        sudo dd if=${DRIVE1} of=${DRIVE2} bs=1M; sync # status=process


##### EOF ######################################################################
