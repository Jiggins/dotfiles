# Fix Docker trying to use TLS on a unix socket
if [[ -n "${DOCKER_TLS_VERIFY}" ]] && [[ "${DOCKER_HOST}" =~ 'unix://' ]]; then
  unset DOCKER_TLS_VERIFY
fi
