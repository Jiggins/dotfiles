# Linux specific config

alias ls='ls --color=auto'

function open() {
  if command -v open > /dev/null; then
    $(which open) "${@}"
    return $?
  fi

  nohup xdg-open "${@}" > /tmp/open.log &
  disown
}

# Need to run `sudo pkgfile --update` for this to work
if [[ -f /usr/share/doc/pkgfile/command-not-found.zsh ]]; then
  source /usr/share/doc/pkgfile/command-not-found.zsh
fi
