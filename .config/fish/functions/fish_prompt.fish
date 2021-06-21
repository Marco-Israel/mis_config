# Defined interactively
function fish_mode_prompt; end

function fish_prompt --description 'Prompt ausgeben'
    set -l color_cwd
    set -l suffix

    if functions -q fish_is_root_user; and fish_is_root_user
        if set -q fish_color_cwd_root
            set color_cwd $fish_color_cwd_root
        else
            set color_cwd $fish_color_cwd
        end

        set suffix '#'
    else
        set color_cwd $fish_color_cwd
        set suffix '>'
    end

    echo -n -s (set_color brcyan) "$USER" (set_color brblack) @ \
       (set_color brmagenta ) (prompt_hostname)  ' ' (set_color brblack) \
       (prompt_pwd) (set_color brmagenta) "$suffix "
end
