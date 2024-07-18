function prepend() {
  ${@} 2>&1 | while read line; do
    printf "${BOLD}%s${RESET} %s\n" "${*}" "${line}"
  done
}
