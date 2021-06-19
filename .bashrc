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

 #Start a tmux session
if [ -z "$TMUX" ]; then
      #tmux attach -t default || tmux new -s default
      tmux
fi


### COLORS ##########
eval `dircolors ~/.dircolors`

        # 256 Colors
if [ -n "$DISPLAY" -a "$TERM" == "xterm" ]; then
export TERM=xterm-256color
fi


### EXECUTE ##########
#~/bin/battery_alert &


### START XORG-XsERVER ##########
if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
 exec startx
fi

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


### Bashmarks ###
if [ -f ~/.local/bin/bashmarks.sh ]; then
    . ~/.local/bin/bashmarks.sh
fi


### FZF integration ###
if [ -f ~/.fzf/fzf-marks/fzf-marks.plugin.bash  ]; then
    . ~/.fzf/fzf-marks/fzf-marks.plugin.bash
fi

if [ -f ~/.fzf/fzf.bash ] ; then
   . ~/.fzf/fzf.bash
fi


### FUF ##########
export FZF_DEFAULT_COMMAND='rg --files --hidden --smart-case --glob "!.git/*"'

source .fzf/functions.sh
if [[ $- =~ i ]]; then
  bind '"\er": redraw-current-line'
  bind '"\C-g\C-f": "$(_gf)\e\C-e\er"'
  bind '"\C-g\C-b": "$(_gb)\e\C-e\er"'
  bind '"\C-g\C-t": "$(_gt)\e\C-e\er"'
  bind '"\C-g\C-h": "$(_gh)\e\C-e\er"'
  bind '"\C-g\C-r": "$(_gr)\e\C-e\er"'
  bind '"\C-g\C-s": "$(_gs)\e\C-e\er"'
fi



# Use ~~ as the trigger sequence instead of the default **
#export FZF_COMPLETION_TRIGGER='~~'

# Options to fzf command
export FZF_COMPLETION_OPTS='--border --info=inline'

# Use fd (https://github.com/sharkdp/fd) instead of the default find
# command for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
  fd --hidden --follow --exclude ".git" . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type d --hidden --follow --exclude ".git" . "$1"
}

# (EXPERIMENTAL) Advanced customization of fzf options via _fzf_comprun function
# - The first argument to the function is the name of the command.
# - You should make sure to pass the rest of the arguments to fzf.
_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf "$@" --preview 'tree -C {} | head -200' ;;
    export|unset) fzf "$@" --preview "eval 'echo \$'{}" ;;
    ssh)          fzf "$@" --preview 'dig {}' ;;
    *)            fzf "$@" ;;
  esac
}


#### EOF #######################################################################
#find -type f -name *.jpg | xargs -I {} convert -strip -interlace Plane -antialias -adaptive-sharpen 1x0,1 -auto-level -quality 30% {} {}

        #Promt yellow
#export PS1="\[\033[38;5;243m\][\[$(tput sgr0)\]\[\033[38;5;214m\]\!\[$(tput sgr0)\]\[\033[38;5;243m\]][\[$(tput sgr0)\]\[\033[38;5;214m\]\u\[$(tput sgr0)\]\[\033[38;5;243m\]]\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]\[\033[38;5;87m\]\w\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]\[\033[38;5;243m\]\\$:\[$(tput sgr0)\]"
        #Promt magenta
export PS1="\[\033[38;5;243m\][\[$(tput sgr0)\]\[\033[38;5;198m\]\!\[$(tput sgr0)\]\[\033[38;5;243m\]][\[$(tput sgr0)\]\[\033[38;5;219m\]\u\[$(tput sgr0)\]\[\033[38;5;243m\]]\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]\[\033[38;5;87m\]\w\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]\[\033[38;5;243m\]\\$:\[$(tput sgr0)\]"

# Promt to magenta
echo -e "\033]12;magenta\007"

        # no duplicates in the history. bash(1) ==  more options
export HISTCONTROL=ignoredups

#### EOF #######################################################################
