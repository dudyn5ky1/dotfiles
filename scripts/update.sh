yadm pull
echo "YADM config updated."

cd ~/Library/ApplicationSupport/Übersicht/widgets/simple-bar
git pull
echo "simple-bar updated."

~/scripts/setup_macos.sh

~/scripts/set_background.sh
echo "Background updated."
