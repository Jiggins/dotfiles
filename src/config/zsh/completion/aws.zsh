if command -v aws_completer; then
  autoload bashcompinit && bashcompinit
  complete -C $(which aws_completer) aws > /dev/null
fi
