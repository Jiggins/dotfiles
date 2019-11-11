# macOS specific config

alias ls='ls -G'

# Use GNU versions of common shell tools if the exist (useful on macOS)
command -v 'gsed' >/dev/null && alias sed='gsed'
command -v 'gtar' >/dev/null && alias tar='gtar'

function finder() {
  for file in "${@}"; do
    if [[ -d "${file}" ]]; then
      open "${file}"
    else
      open $(dirname "${file}")
    fi
  done
}

function preview() {
  pandoc --standalone --to  html --template ~/.pandoc/template.html --css ~/.pandoc/template.css "${@}" --metadata pagetitle=${1/.md/} > "/tmp/${1/md/html}" \
    && open -g -a Safari "/tmp/${1/md/html}"
}

# iTerm2 integration
if [[ -e "${HOME}/.iterm2_shell_integration.zsh" ]]; then
  source "${HOME}/.iterm2_shell_integration.zsh"
fi
