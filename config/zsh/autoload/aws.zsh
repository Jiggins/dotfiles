if command -v aws_completer > /dev/null; then
  autoload bashcompinit && bashcompinit
  complete -C $(which aws_completer) aws > /dev/null
fi
