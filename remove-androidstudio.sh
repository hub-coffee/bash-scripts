#!/bin/bash

#Remove all files and folders for android studio following this method:

echo "Starting to delete all files for AndroidStudio. Please wait..."
# Deletes the Android Studio application

#Kill Android studio process if its up
#PROCESS_KILL_ERROR=$(ps -eo pid,cmd | grep -Ev "^ {0,1}([0-9]*) grep.*" | grep -E 'java.*android-studio' | sed -re 's/ {0,1}([0-9]*) .*/\1/' | head -n1 | xargs kill -9)

#echo ""
#echo "PROCESS_KILL_ERROR: $PROCESS_KILL_ERROR"

# Note that this may be different depending on what you named the application as, or whether you downloaded the preview version
rm -Rf /Applications/Android\ Studio.app

# Delete All Android Studio related preferences
# The asterisk here should target all folders/files beginning with the string before it
rm -Rf ~/Library/Preferences/AndroidStudio*
rm -Rf ~/Library/Preferences/Google/AndroidStudio*

# Deletes the Android Studio's plist file
rm -Rf ~/Library/Preferences/com.google.android.*

# Deletes the Android Emulator's plist file
rm -Rf ~/Library/Preferences/com.android.*

# Deletes mainly plugins (or at least according to what mine (Edric) contains)
rm -Rf ~/Library/Application\ Support/AndroidStudio*
rm -Rf ~/Library/Application\ Support/Google/AndroidStudio*

# Deletes all logs that Android Studio outputs
rm -Rf ~/Library/Logs/AndroidStudio*
rm -Rf ~/Library/Logs/Google/AndroidStudio*

# Deletes Android Studio's caches
rm -Rf ~/Library/Caches/AndroidStudio*

# Deletes older versions of Android Studio
rm -Rf ~/.AndroidStudio*

#If you want to remove all existant projects run this commandline:
rm -Rf ~/AndroidStudioProjects

#If you want to remove all gradle elements run this: 
rm -Rf ~/.gradle

#Remove all AVD element try this:
rm -Rf ~/.android

#Remove all SDK l-element use this:
rm -Rf ~/Library/Android*

#Remove console emulator authentification token through this:
rm -Rf ~/.emulator_console_auth_token

echo ""
echo "=== SCRIPT made by Huberson  ====="
echo "=================================="
echo ""
echo "Thank you! Your AndroidStudio files are been successfully removed."
echo ""
echo "=================================="
echo "=== SCRIPT made by Huberson  ====="
echo "=================================="