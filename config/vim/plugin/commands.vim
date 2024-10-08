" Fix White Space - Removes trailing whitespace from file
command! FixWhitespace mark ` | %s/\t/  /ge | %s/\s\+$//ge | %s/\($\n\s*\)\+\%$/\r/e | noh | execute "normal" "``"

" Custom Jump function
" Used with `[[` and `]]`
" Thanks to http://vi.stackexchange.com/users/54/romainl for
" http://vi.stackexchange.com/a/6074/5952
function! CustomJump(motion) range
    let l:cnt = v:count1
    let l:save = @/
    mark '
    while l:cnt > 0
        silent! execute a:motion
        let l:cnt = l:cnt - 1
    endwhile
    call histdel('/', -1)
    let @/ = l:save
endfunction

command Mail execute "w !pandoc -t html --template ~/.pandoc/template.html --css ~/.pandoc/template.css -o /tmp/email.html && open /tmp/email.html"
