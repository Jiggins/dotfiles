# https://iterm2.com/documentation-escape-codes.html

declare OSC='\033]'
declare ST='\a'

export FIREWORKS="${OSC}1337;RequestAttention=fireworks${ST}"

function fireworks() {
  if [[ -n "${TMUX:-}" ]]; then
    set -x
    printf "\ePtmux;\e\e]1337;RequestAttention=fireworks\a\e\\"
    return $?
  fi

  printf "${OSC}1337;RequestAttention=fireworks${ST}"
}

function openurl() {
  if [[ -z "${TMUX:-}" ]]; then
    printf "\033]1337;OpenURL=:%s\a" "$(echo -n "${1}" | base64)"
    return $?
  fi

  printf "\ePtmux;\e\e]1337;OpenURL=:%s\a\e\\" "$(echo -n "${1}" | base64)"
}
