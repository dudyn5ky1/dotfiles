currentLang=$(xkbswitch -ge)
currentIndex=0
layouts=(ABC PolishPro Ukrainian-PC Russian)
for i in "${!layouts[@]}"; do
  if [[ "${layouts[$i]}" = "${currentLang}" ]]; then
    currentIndex=($i)
  fi
done
if [[ $currentIndex -eq 3 ]]
then
  echo "yes its here"
  xkbswitch -se "${layouts[0]}"
else
  nextIndex=$(($currentIndex+1))
  nextLang="${layouts[$nextIndex]}"
  xkbswitch -se $nextLang
fi
echo $currentIndex
osascript -e "tell application id \"tracesOf.Uebersicht\" to refresh widget id \"simple-bar-data-jsx\""

