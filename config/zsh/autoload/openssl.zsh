function getcert() {
  local endpoint="${1}"
  local port="${2:-443}"

  openssl s_client -connect "${endpoint}:${port}" -servername "${endpoint}" < /dev/null \
    | openssl x509 -noout -text \
    | bat -l yaml
}
