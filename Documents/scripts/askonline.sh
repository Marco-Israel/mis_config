#!/bin/bash
#
################################################################################
#
#@author    Marco Israel (MI)
#@date      2020-06
#@authors   Last changed by:  Marco Israel - 2020.
#
#
#@brief     Opens a webbrowser and search online the given word string.
#@details   Pass a word or a string (in quats) to a online search machine by
#           opening a webbrowser.
#           By DEFAULT '$BROWSER' will be opend which is asking '$ENGINE'
#
#@TODO      Add support for more Browsers and search engins
#
################################################################################


BROWSER="firefox"
ENGINE="google"
ENGINEURL="https://www.startpage.com/do/search?q="



_usage() {
cat <<-EOF

--------------------------------------------------------------------------------

                "${0##*/}"

  ABOUT:
Opens a webbrowser and search online the given word or string.
By DEFAULT '$BROWSER' will be opend which is asking '$ENGINE'


  USAGE:
"$0"  <word or "search-string">  [<search-engine>]  [<browser>]


--------------------------------------------------------------------------------

EOF
}



_getopts() {

    while [ $# -gt 0 ]
    do
        case "$1" in
            g | google)
				$ENGINE=$1
				$ENGINEURL="https://www.google.com/search?q="
                ;;
            sp | startpage)
				$ENGINE=$1
				$ENGINEURL="https://www.startpage.com/do/search?q="
                ;;

            ff | firefox)
				$BROWSER="firefox"
                ;;
            m | min) echo TODO
				$BROWSER="min"
                ;;
            *)
				while [ $# -gt 0 ]
    			do
					SEARCH="$SEARCH%20$1"
					shift
				done
                ;;
        esac
        echo $SEARCH
        shift
    done
}

_search() {
	echo "Asking $ENGINE for: $SEARCH"
    $BROWSER "$ENGINEURL$SEARCH"
}


##### MAIN #####################################################################

if [ "$#" -gt 0 ]
then

    _getopts "$@"
	_search

else
   _usage
fi


##### EOF ######################################################################
