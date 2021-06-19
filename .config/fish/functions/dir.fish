# Defined in - @ line 1
function dir --wraps='dir --color=always' --description 'alias dir=dir --color=always'
 command dir --color=always $argv;
end
