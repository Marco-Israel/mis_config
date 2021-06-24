## Defined interactively
#
#function fish_prompt --description 'Prompt ausgeben'
#    set -l color_cwd
#    set -l suffix
#
#    if functions -q fish_is_root_user; and fish_is_root_user
#        if set -q fish_color_cwd_root
#            set color_cwd $fish_color_cwd_root
#        else
#            set color_cwd $fish_color_cwd
#        end
#
#        set suffix '#'
#    else
#        set color_cwd $fish_color_cwd
#        set suffix '>'
#    end
#
#    echo -n -s (set_color brcyan) "$USER" (set_color brblack) @ \
#       (set_color magenta ) (prompt_hostname)  ' ' (set_color brblack) \
#       (prompt_pwd) (set_color brmagenta) "$suffix "
#end

function fish_mode_prompt; end

function fish_prompt
  #set -l last_status $status
  set -g __fish_git_prompt_showdirtystate "yes"
  set -g __fish_git_prompt_showstashstate 1
  set -g __fish_git_prompt_show_informative_status 1
  set -g __fish_git_prompt_showcolorhints 1
  #set -g __fish_git_prompt_hide_untrackedfiles 0
  set -g __fish_git_prompt_showuntrackedfiles 1
  set -g __fish_git_prompt_showupstream informative
  set -g __fish_git_prompt_color_prefix brblack
  set -g __fish_git_prompt_color_suffix brblack
  set -g __fish_git_prompt_color_bare brcyan
  set -g __fish_git_prompt_color_merging bryellow
  set -g __fish_git_prompt_color_stashstate bryellow
  set -g __fish_git_prompt_color_upstream brmagenta
  set -g __fish_git_prompt_color_branch brcyan
  set -g __fish_git_prompt_color_dirtystate brmagenta
  set -g __fish_git_prompt_color_stagedstate yellow
  set -g __fish_git_prompt_color_invalidstate brred
  set -g __fish_git_prompt_color_untrackedfiles brmagenta
  set -g __fish_git_prompt_color_cleanstate brmagenta
  set -g __fish_git_prompt_color brblack

  set -g __fish_git_prompt_char_stateseparator ":"
  set -g __fish_git_prompt_char_upstream_ahead ">"
  set -g __fish_git_prompt_char_upstream_behind "<"
  set -g __fish_git_prompt_char_upstream_diverged "><"
  set -g __fish_git_prompt_char_upstream_equal "="
  set -g __fish_git_prompt_char_upstream_prefix "::"
  set -g __fish_git_prompt_char_invalidstate "#"
  #set -g __fish_git_prompt_char_stashstate "$"

  set -g __fish_git_prompt_char_stagedstate "+"
  set -g __fish_git_prompt_char_dirtystate "-"
  set -g __fish_git_prompt_char_untrackedfiles "?"
  set -g __fish_git_prompt_char_conflictedstate "x"
  set -g __fish_git_prompt_char_cleanstate "#"


 printf "%s " (__fish_git_prompt)


end
