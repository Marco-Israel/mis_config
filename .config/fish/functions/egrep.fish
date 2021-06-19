# Defined in - @ line 1
function egrep --wraps='egrep --color=always' --description 'alias egrep=egrep --color=always'
 command egrep --color=always $argv;
end
