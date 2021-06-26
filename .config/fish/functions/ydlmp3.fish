# Defined in - @ line 1
function ydlmp3 --wraps='youtube-dl --extract-audio --audio-format mp3' --description 'alias ydlmp3=youtube-dl --extract-audio --audio-format mp3'
  youtube-dl --extract-audio --audio-format mp3 $argv;
end
