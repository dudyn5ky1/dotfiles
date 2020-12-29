CURRENT_INPUT_VOLUME=$(osascript -e "input volume of (get volume settings)")

if [[ $CURRENT_INPUT_VOLUME -eq 0 ]]
then
  osascript -e "tell application \"System Events\" to set volume input volume 100"
else
  osascript -e "tell application \"System Events\" to set volume input volume 0"
fi
osascript -e "tell application id \"tracesOf.Uebersicht\" to refresh widget id \"simple-bar-data-jsx\""
