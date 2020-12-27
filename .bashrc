################################################################################
# ~/.bashrc
#
#@author    Marco Israel (MI)
#@date      2018-01
#@authors   Last changed by:  Marco Israel - 2020.
#
################################################################################

[[ $- != *i* ]] && return


### CONFIGURATOION ##########
#ignore Ctrl-C to exit the shell
set -o ignoreeof
#enable vi mode in bash
set -o vi



### ALIAS ##########
if [ -f "${HOME}/.bash_alias" ] ; then
  source "${HOME}/.bash_alias"
fi



### COLORS ##########
eval `dircolors ~/.dircolors`

        # 256 Colors
if [ -n "$DISPLAY" -a "$TERM" == "xterm" ]; then
export TERM=xterm-256color
fi

echo -e "\033]12;magenta\007"



### EXECUTE ##########
#~/bin/battery_alert &

	#  #Start Xorg-XServer
#if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
#  exec startx
#fi
#


#'startxwin & -- -listen tcp'


            #Autocompleat if exists
if [ -f /etc/bash_completion ]; then
  . /etc/bash_completion
elif [ -f  /usr/share/bash-completion/bash_completion ]; then
  . /usr/share/bash-completion/bash_completion
elif [ -f  /usr/local/share/bash-completion/bash_completion  ]; then
  . /usr/local/share/bash-completion/bash_completion
else
  echo "Bash-compleation not installed!"
fi


if [ -f ~/.local/bin/bashmarks.sh ]; then
    . ~/.local/bin/bashmarks.sh
fi

if [ -f ~/.fzf/fzf-marks/fzf-marks.plugin.bash  ]; then
    . ~/.fzf/fzf-marks/fzf-marks.plugin.bash
fi

if [ -f ~/.fzf.bash ] ; then
   . ~/.fzf.bash
fi


### EXPORTS ##########
export PROJECT_HOME="~/programming/MIS_BUILD"


export FZF_DEFAULT_COMMAND='rg --files --hidden --smart-case --glob "!.git/*"'


        # no duplicates in the history. bash(1) ==  more options
export HISTCONTROL=ignoredups




#### EOF #######################################################################
#find -type f -name *.jpg | xargs -I {} convert -strip -interlace Plane -antialias -adaptive-sharpen 1x0,1 -auto-level -quality 30% {} {}

