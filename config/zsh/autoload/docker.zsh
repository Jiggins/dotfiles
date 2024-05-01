# Completion
function downloadCompletion() {
  local completionfile="${HOME}/.config/zsh/completion/_docker"

  if [[ ! -f "${completionfile}" ]]; then
    curl \
      -L https://raw.githubusercontent.com/docker/cli/master/contrib/completion/zsh/_docker \
      -o "${completionfile}"
  fi
}

downloadCompletion

# Fix Docker trying to use TLS on a unix socket
if [[ -n "${DOCKER_TLS_VERIFY}" ]] && [[ "${DOCKER_HOST}" =~ 'unix://' ]]; then
  unset DOCKER_TLS_VERIFY
fi
