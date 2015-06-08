" Tabs
vnoremap <Tab> >
vnoremap <S-Tab> <

vmap <C-/> gc<CR>
nnoremap <C-b>  :tabprevious<CR>
inoremap <C-b>  <Esc>:tabprevious<CR>i
nnoremap <C-n>  :tabnext<CR>
inoremap <C-n>  <Esc>:tabnext<CR>i
nnoremap <C-t>  :tabnew<CR>
inoremap <C-t>  <Esc>:tabnew<CR>i

" Toggles
let mapleader = ';'
nnoremap <Leader>p :set invpaste<CR>:set paste?<CR>
nnoremap <Leader>w :set invlist<CR>:set list?<CR>
nnoremap <Leader>W :FixWhitespace<CR>
nnoremap <Leader>n :set invnumber<CR>:set number?<CR>

if exists(':GitGutterToggle')
  nnoremap <Leader>n :set invnumber<CR>:GitGutterToggle<CR>:GitGutter<CR>:set number?<CR>
endif

" Toggle background transparency
:function! ToggleTransparency()
  if g:colors_name == 'monokai'
    colorscheme Monokai-Transparent
    echo g:colors_name
  elseif g:colors_name == 'monokai-transparent'
    colorscheme Monokai
    echo g:colors_name
  endif
endfunction

nnoremap <leader>t :call ToggleTransparency()<CR>
nnoremap <leader>; q:

" Splitting Windows
nnoremap <Leader><Left>  :Vexplore  <CR>
nnoremap <Leader><Right> :Vexplore! <CR>
nnoremap <Leader><Up>    :Sexplore  <CR>
nnoremap <Leader><Down>  :Hexplore  <CR>

nnoremap <Leader>h       :Vexplore  <CR>
nnoremap <Leader>l       :Vexplore! <CR>
nnoremap <Leader>k       :Sexplore  <CR>
nnoremap <Leader>j       :Hexplore  <CR>

nnoremap <S-Tab> <C-w><C-w>

" Plugin options
if exists(':MultipleCursorFind')
  let g:multi_cursor_next_key='<C-d>'
  let g:multi_cursor_prev_key='<C-e>'
  let g:multi_cursor_skip_key='<C-D>'
  let g:multi_cursor_quit_key='<Esc>'
endif

let tmux=$TMUX
if tmux != ''
  nnoremap <silent> <C-Left>  :TmuxNavigateLeft<cr>
  nnoremap <silent> <C-Down>  :TmuxNavigateDown<cr>
  nnoremap <silent> <C-Up>    :TmuxNavigateUp<cr>
  nnoremap <silent> <C-Right> :TmuxNavigateRight<cr>
  nnoremap <silent> <C-Tab>   :TmuxNavigatePrevious<cr>

  nnoremap <silent> <M-Left>  :TmuxNavigateLeft<cr>
  nnoremap <silent> <M-Down>  :TmuxNavigateDown<cr>
  nnoremap <silent> <M-Up>    :TmuxNavigateUp<cr>
  nnoremap <silent> <M-Right> :TmuxNavigateRight<cr>
  nnoremap <silent> <M-Tab>   :TmuxNavigatePrevious<cr>
else
  map <silent> <C-Left>  <C-h>
  map <silent> <C-Down>  <C-j>
  map <silent> <C-Up>    <C-k>
  map <silent> <C-Right> <C-l>
  map <silent> <C-Tab>   <C-w><C-w><cr>
endif

