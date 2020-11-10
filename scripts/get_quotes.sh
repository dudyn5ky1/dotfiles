QUOTE=$(sed '/^\s*$/d' ~/Documents/notes/business/quotes.md | sort -R | head -n 1)
echo "${QUOTE:2}"
