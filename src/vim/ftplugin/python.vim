" t	Auto-wrap text using textwidth
" c	Auto-wrap comments using textwidth, inserting the current comment
" 	leader automatically.
" r	Automatically insert the current comment leader after hitting
" 	<Enter> in Insert mode.
" q	Allow formatting of comments with "gq".
" 	Note that formatting will not change blank lines or lines containing
" 	only the comment leader.  A new paragraph starts after such a line,
" 	or when the comment leader changes.
" j	Where it makes sense, remove a comment leader when joining lines.  For
" 	example, joining:
setlocal formatoptions=tcrqj

" Since Python uses 4 spaces for indentaion and relatively large variable
" names, wrap at 120 characters iunstead of 80.
setlocal textwidth=120

highlight BadWhitespace ctermbg=red guibg=red
let matchBadWhitespace = matchadd("BadWhitespace", "\\s\\+$")

highlight BadTabs ctermbg=red guibg=red
let matchBadTabs = matchadd("BadTabs", "^\\t+")

nmap <c-]> :ALEGoToDefinition<cr>

let b:undo_ftplugin = 'setlocal formatoptions<|setlocal completeopt<'
