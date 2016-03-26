function cconv -d 'Currency Converter'
   env LCTYPE=C wget -qO- "http://www.google.com/finance/converter?a=$1&from=$2&to=$3" | env LCTYPE=C sed '/res/!d;s/<[^>]*>//g';
end
