#!/bin/bash

_usage() {
cat <<-EOF
                "${0##*/}"
################################################################################

@author    Marco Israel (MI)
@date      2020-12
@authors   Last changed by:  Marco Israel - 2020.


@brief     Daylie doing jobs like backup


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
#File global variables
DRIVE="/data/00_Sicherungen/linux/home"


################################################################################
#File local functions
_backup_home() {

HOMES="mis"

for HOME in $HOMES; do
     cd /home/$HOME
     rsync -cdlptgov --delete . /$DRIVE/$HOME
     find . -maxdepth 1 -type d -not -name "." -exec rsync -crlptgov --delete {} /$DRIVE/$HOME \;
done

}

_git(){
    cd /home/$HOME
    git add .
    git commit -m "WIP DAYLY configs"
    git push
}

_git_project{
    cd $PROJECT_HOME/mis_ooc
    git add .
    git commit -m "WIP DAYLY"
    git push
}




##### MAIN #####################################################################

if [ "$#" -gt 1 ]
then

    _getopts "$@"

else
   _usage

#    echo "#####################################################################"
#    echo ""
#    echo "USAGE:"
#    echo "${0##*/} [<serach-engin>] \"<search string>\""
#    echo ""
#    echo "#####################################################################"
fi

##### EOF ######################################################################
