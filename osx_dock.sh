#!/bin/bash
which -s dockutil > /dev/null

if [ $? -ne 0 ]; then
  echo "dockutil not found, please install it from \`assets\` path"
  exit 1
fi

# can we do this using boxen?
defaults write com.apple.dock static-only -bool TRUE
defaults write com.apple.dock tilesize -int 40

# Remove Default Apps
for app in Siri Launchpad Safari Mail Contacts Calendar Notes Reminders Maps Photos Messages FaceTime Pages Numbers Keynote iTunes iBooks \"App Store\" \"System Preferences\"; do dockutil --remove $app --allhomes --no-restart; done

# Add Chrome, Terminal and Atom as static items
dockutil --add /Applications/Google\ Chrome.app --allhomes --no-restart
dockutil --add /Applications/Utilities/Terminal.app --after "Google Chrome" --allhomes --no-restart
dockutil --add /Applications/Atom.app --after "Terminal" --allhomes --no-restart

dockutil --move "Google Chrome" --position 1 --allhomes --no-restart
dockutil --move "Terminal" --position 2 --allhomes --no-restart
dockutil --move "Atom" --position 3 --allhomes --no-restart

killall Dock
