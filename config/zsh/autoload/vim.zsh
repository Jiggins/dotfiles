# Open vim immediately into a Ripgrep + FZF search.
# Optionally takes a search query as an argument
function vrg() {
  vim "+Rg ${1:-}"
}
