" Fix White Space - Removes trailing whitespace from file
command! FixWhitespace mark ` | %s/\t/  /ge | %s/\s\+$//ge | %s/\($\n\s*\)\+\%$/\r/e | noh | execute "normal" "``"

