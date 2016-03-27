" Tabs
vnoremap <Tab> >
vnoremap <S-Tab> <

nnoremap <C-b>  :tabprevious<CR>
inoremap <C-b>  <Esc>:tabprevious<CR>i
nnoremap <C-l>  :redraw!<CR>
inoremap <C-l>  <Esc>:redraw!<CR>i
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

nnoremap <leader>: q:
nnoremap <leader>; ;

" Copy and paste
" Copy to 'clipboard registry'
nnoremap <Leader>c "*y

" Commands
" Remapping due to constant mistakes
:command WQ wq
:command Wq wq
:command W w
:command Q q

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

" Resize windows
nnoremap <silent> + :resize +1<CR>
nnoremap <silent> _ :resize -1<CR>

" Continuous scroll accross two panes
noremap <silent> <leader>sc :<C-u>let @z=&so<CR>:set so=0 noscb<CR>:bo vs<CR>Ljzt:setl scb<CR><C-w>p:setl scb<CR>:let &so=@z<CR>

" Plugin options

" GhcMod
" Remap Haskell-mode bindings to the better GhcMod commands.
nnoremap _t :GhcModType<CR>
nnoremap _T :GhcModTypeInsert<CR>

" LimeLight
nnoremap <Leader>i :Limelight<CR>
xnoremap <Leader>i :Limelight<CR>

" MultipleCursorFind
if exists(':MultipleCursorFind')
  let g:multi_cursor_next_key='<C-d>'
  let g:multi_cursor_prev_key='<C-e>'
  let g:multi_cursor_skip_key='<C-D>'
  let g:multi_cursor_quit_key='<Esc>'
endif

" Syntastic
nnoremap <Leader>s :SyntasticCheck<CR>
nnoremap <Leader>S :SyntasticCheck<CR> :SyntasticReset<CR> :SyntasticToggleMode<CR>"

" Tagbar
nmap <F6> :TagbarToggle<CR>
nmap <leader>t :TagbarToggle<CR>

" TMUX
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

" Vimux
" Default to open shell
" Overwritten in ftplugins
nnoremap <Leader>vc :VimuxRunCommand("")<CR>
nnoremap <Leader>vz :call VimuxZoomRunner()<CR>

function! VimuxSlime()
  call VimuxSendText(@v)
  call VimuxSendKeys("Enter")
endfunction

" If text is selected, save it in the v buffer and send that buffer it to tmux
vmap <LocalLeader>vv "vy :call VimuxSlime()<CR>

" Select current paragraph and send it to tmux
nmap <LocalLeader>vv vip<LocalLeader>vs<CR>
