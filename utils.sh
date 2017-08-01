LOGFILE="log/$(date +%Y-%m-%d)-install.log"

# Logging
mkdir ${VERBOSE} -p log
date > ${LOGFILE}

function log {
  while read line; do
    if [ ${VERBOSE+x} ]; then
      echo -e "$line" | tee -a $LOGFILE
    else
      echo -e "$line" >> $LOGFILE
    fi
  done
}

# Checks if a command is installed
function commandExists {
  return $(command -v $1 > /dev/null)
}

# $1: File to prepend (Will appear at the top of $2)
# $2: File to prepend to (output file)
function prependFile {
  if [ ! $# -eq 2 ]; then
    echo 'prependFile expects two arguments:'
    echo '  $1: File to prepend (Will appear at the top of $2)'
    echo '  $2: File to prepend to (output file)'
    return 1
  elif [ ! -e $2 ]; then
    echo -e "Copying $1 to $2" | log
    cp $1 $2
  else
    echo -e "Prepending $1 to $2" | log
    cp $1 tmp
    cat $2 >> tmp
    mv tmp $2
  fi

  return 0
}
