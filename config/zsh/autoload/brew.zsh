if [[ -d "$(brew --prefix)/share/zsh/site-functions" ]]; then
  fpath+=( "$(brew --prefix)/share/zsh/site-functions" )
fi
