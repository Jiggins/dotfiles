" From https://vi.stackexchange.com/a/5782
function! GetFiletypes()
    " Get a list of all the runtime directories by taking the value of that
    " option and splitting it using a comma as the separator.
    let rtps = split(&runtimepath, ',')
    " This will be the list of filetypes that the function returns
    let filetypes = []

    " Loop through each individual item in the list of runtime paths
    for rtp in rtps
        let syntax_dir = rtp . '/syntax'
        " Check to see if there is a syntax directory in this runtimepath.
        if (isdirectory(syntax_dir))
            " Loop through each vimscript file in the syntax directory
            for syntax_file in split(glob(syntax_dir . '/*.vim'), '\n')
                " Add this file to the filetypes list with its everything
                " except its name removed.
                call add(filetypes, fnamemodify(syntax_file, ':t:r'))
            endfor
        endif
    endfor

    " This removes any duplicates and returns the resulting list.
    " NOTE: This might not be the best way to do this, suggestions are welcome.
    return uniq(sort(filetypes))
endfunction
