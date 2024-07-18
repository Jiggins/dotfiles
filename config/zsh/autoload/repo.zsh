function repo() {
  cd $(cd $(dirname "${1}") && findup .git)
}
