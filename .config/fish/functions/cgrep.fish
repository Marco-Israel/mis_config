# Defined in - @ line 1
function cgrep --wraps='grep --color=always' --description 'alias cgrep=grep --color=always'
  grep --color=always $argv;
end
