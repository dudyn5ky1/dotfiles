CURRENT_INPUT_VOLUME=$(osascript -e "input volume of (get volume settings)")

if [[ $CURRENT_INPUT_VOLUME -eq 100 ]]
then
  osascript -e "tell application \"System Events\" to set volume input volume 0"
else
  osascript -e "tell application \"System Events\" to set volume input volume 100"
fi 
osascript -e 'tell application "Übersicht" to refresh widget id "simple-bar-data-jsx"'
