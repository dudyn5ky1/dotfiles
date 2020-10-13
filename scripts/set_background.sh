#!/usr/bin/env bash

osascript <<END 
tell application "System Events"
    tell every desktop
        set picture to "~/background.png"
    end tell
end tell
END
killall Dock
