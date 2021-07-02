#Remove fish default greeting
set -U fish_greeting

## Start X at login
#if status is-login
#    if test -z "$DISPLAY"
#        exec startx -- -keeptty
#    end
#end

#Start a tmux session
#if test -z "$TMUX"
#     #tmux attach -t default || tmux new -s default
#     exec tmux
#end

function fish_mode_prompt; end

# To just rerun your last command, simply type '!!'
# '!! sudo' will prepend sudo to your most recent command
# Running !! with anything other than sudo will append the argument to your most recent command
# To add another command to prepend list remove the # on line 10 and put the command in the quotes. Repeat as needed
function !!
  set var (history | head -n 1)
  if test $argv
    if test $argv = "sudo"        #; or "any other command you want to prepend"
        eval $argv $var
    else
        eval $var $argv
    end
    else
        eval $var
  end
end


# Launch debugger on SIGTRAP
#
function fish_sigtrap_handler --on-signal TRAP --no-scope-shadowing --description "Signal handler for the TRAP signal. Launches a debug prompt."
    breakpoint
end


# Allow %n job expansion to be used with fg/bg/wait
# `jobs` is the only one that natively supports job expansion
function __fish_expand_pid_args
    for arg in $argv
        if string match -qr '^%\d+$' -- $arg
            if not jobs -p $arg
                return 1
            end
        else
            printf "%s\n" $arg
        end
    end
end

for jobbltn in bg wait disown
    function $jobbltn -V jobbltn
        builtin $jobbltn (__fish_expand_pid_args $argv)
    end
end

function fg
    builtin fg (__fish_expand_pid_args $argv)[-1]
end

function kill
    command kill (__fish_expand_pid_args $argv)
end
set fish_color_valid_path
set -gx EDITOR vim

thefuck --alias  | source

# Load fishmarks (http://github.com/techwizrd/fishmarks)
. $HOME/.fishmarks/marks.fish
clear
