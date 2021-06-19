
#!/bin/bash


_usage() {
cat <<-EOF
                "${0##*/}"
################################################################################

@author    Marco Israel (MI)
@date      2020-07
@authors   Last changed by:  Marco Israel - 2020.


@brief     Shrinks all images in filezize of a given folder.
@details   Reduces the file size by deleating Information, preforms some
            optimatsations and filters and (but) also reduces the quality if
            given parameter by the user is less than '100' (Prozent of quality).
            ATTENTION:  All old images in a folder wil be replaced.
            NOTE:       This works currently only for a howl folder; not a file.
            NOTE:       This works currently only for *.jpg files.


  USAGE:
 "${0##*/} <PathToImageFolder> <newImageQuality>  [--newName]

 <newImageQuality>      The new quality of the image in percentage. Given a
                        Value e.g. of '80' means 'reduce the Qulity to 80% of
                        the current quality.' This is done e.g. by deleating
                        pixel and/or color information (like replace nearly same
                        colores in an area with on single).
                        DEFAULT: 30 (percentage of the original)

 --help             Show this help.

 --newResultion     Change the resolution to the given two paramters: H W
                        H: First parameter: The (new) high
                        W: Second parameter: The (new) width
                    NOTE: This opten ist 'tobedone' and not implemented yet.

 --newName          The name of the new Image. Use this if you do not want to
                    Replace the old file.
                    DEFAULT: Replace it. Takes the same name of the original.
                    NOTE: This opten ist 'tobedone' and not implemented yet.

--newQuality        The quality in percentage of the new image.
                    NOTE: This opten ist 'tobedone' and not implemented yet. You
                    can/need to set the quality simply as second parameter to
                    the script.

--imageTypes        The image types by extension like *.jpg or *.png
                    NOTE: This opten ist 'tobedone' and not implemented yet.
                    DEFAULT: *.jpg is hard coded used.


 @example
 1:
 "${0##*/} 80 "

 2:
 "${0##*/} 80 --newName newReducedImage.jpg"

 3:
 "${0##*/} --newResultion  250 272"



 @todo  TODO:   Implement option --newResultution h B
        TODO:   Implement option --newNewName newName
        TODO:   Implement option --newNewQuality newQulityIngeger
        TODO:   Implement option --imageTypes A LIST of image types to replace
        TODO:   select if only a single file or a howl folder should be replaced


 @attention     ATTENTION:  By default: THE NEW IMAGE WILL BE REPLACED and
                            REDUCED IN QUALITY.


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

##### MAIN #####################################################################

if [ "$#" -gt 0 ] && [[ "$1" != "--help" ]]
then

    local -i SIZE=30
    if [ "$#" -gt 1 ]  && [ "$2" -ge 0 ]
    then
        SIZE"=$2"
    fi

    sudo find "$1" -type f -name *.jpg | xargs -I {} sudo convert -strip    \
        -interlace Plane -antialias -adaptive-sharpen 1x0,1                 \
        -quality "${SIZE}"% -auto-level {} {}

else
   _usage

fi

##### EOF ######################################################################
