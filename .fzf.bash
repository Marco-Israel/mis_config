# Setup fzf
# ---------
if [[ ! "$PATH" == */home/mis/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/home/mis/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/mis/.fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "/home/mis/.fzf/shell/key-bindings.bash"
