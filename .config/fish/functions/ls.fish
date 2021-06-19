# Defined in - @ line 1
function ls --wraps='ls -la --color=always' --description 'alias ls=ls  -la --color=always'
 command ls -la --color=always $argv;
end
