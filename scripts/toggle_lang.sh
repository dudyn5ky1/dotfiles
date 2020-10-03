currentLang=$(xkbswitch -g)
if [[ $currentLang -eq 3 ]]
then
  xkbswitch -s 0
else 
  nextLang=$(($currentLang+1))
  xkbswitch -s $nextLang
fi
osascript -e 'tell application "Übersicht" to refresh widget id "simple-bar-data-jsx"'

