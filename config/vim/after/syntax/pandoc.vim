" vim-pandoc-syntax loads each of the languages listed in
" g:pandoc#syntax#codeblocks#embeds#langs to allow for embedding of languages
" in markdown code blocks. Unfortunately it keeps any side affects generated
" by language files. In this case the haskell-vim plugin turns off spell
" checking for top level code which makes sense for Haskell but not for
" Markdown. The below turns back on top level spell checking for Markdown.
syn spell toplevel
