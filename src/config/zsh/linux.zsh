# Linux specific config

alias ls='ls --color=auto'

function open() {
  nohup xdg-open "${@}" > /tmp/open.log &
  disown
}
