############################################################################
# General UI/UX                                                            #
############################################################################

# Set computer name (as done via System Preferences → Sharing)
sudo scutil --set ComputerName "tim"
sudo scutil --set LocalHostName "tim"
sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string "tim"

# Disable the sound effects on boot
sudo nvram SystemAudioVolume=" "

# Menu bar: show remaining battery time (on pre-10.8); hide percentage:
defaults write com.apple.menuextra.battery ShowPercent -string "YES"
defaults write com.apple.menuextra.battery ShowTime -string "YES"

# Check for software updates daily, not just once per week:
defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1

# General: Enable save documents to iCloud:
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

# Reveal IP address, hostname, OS version, etc. when clicking the clock in the login window:
sudo defaults write /Library/Preferences/com.apple.loginwindow AdminHostInfo HostName

############################################################################
# Finder                                                                   #
############################################################################

# Show the ~/Library folder.
chflags nohidden ~/Library

# Always open everything in Finder's list view:
defaults write com.apple.Finder FXPreferredViewStyle Nlsv

# Show Path bar in Finder
defaults write com.apple.finder ShowPathbar -bool true

# Show Status bar in Finder
defaults write com.apple.finder ShowStatusBar -bool true

# Show icons for hard drives, servers, and removable media on the desktop
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true && \
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool true && \
defaults write com.apple.finder ShowMountedServersOnDesktop -bool true && \
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true

# Finder: allow text selection in Quick Look
defaults write com.apple.finder QLEnableTextSelection -bool true

# Finder: display full path as Finder window title:
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

# When performing a search, search the current folder by default:
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# Avoid creating .DS_Store files on network volumes:
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

# Use columns view in all Finder windows by default. Four-letter codes for the other view modes: `icnv`, `Nlsv`, `Flwv`:
defaults write com.apple.finder FXPreferredViewStyle -string "clmv"

# General: automatically quit printer app once the print jobs complete:
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

############################################################################
# Trackpad, mouse, keyboard, Bluetooth accessories, and input              #
############################################################################

# Trackpad: enable tap to click:
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

# Trackpad: enable bottom right corner to right-click
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadCornerSecondaryClick -int 2
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadRightClick -bool true

defaults -currentHost write NSGlobalDomain com.apple.trackpad.trackpadCornerClickBehavior -int 1
defaults -currentHost write NSGlobalDomain com.apple.trackpad.enableSecondaryClick -bool true

# Enable full keyboard access for all controls (e.g. enable Tab in modal dialogs)
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

# Disable press-and-hold for keys in favor of key repeat:
defaults write -g ApplePressAndHoldEnabled -bool false

# Set a really fast key repeat:
defaults write NSGlobalDomain KeyRepeat -int 0

# General: automatically illuminate built-in MacBook keyboard in low light
defaults write com.apple.BezelServices kDim -bool true

# Turn off keyboard illumination when computer is not used for 5 minutes
defaults write com.apple.BezelServices kDimTime -int 300

# Set language and text formats
# Note: if you’re in the US, you may replace `EUR` with `USD`, `Centimeters`
# with `Inches`, `en_GB` with `en_US`, and `true` with `false`.
defaults write NSGlobalDomain AppleLanguages -array "en"
defaults write NSGlobalDomain AppleLocale -string "de_DE@currency=EUR"
defaults write NSGlobalDomain AppleMeasurementUnits -string "Centimeters"
defaults write NSGlobalDomain AppleMetricUnits -bool true

# General: enable auto-correct
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

############################################################################
# Screen                                                                   #
############################################################################

# Require password immediately after sleep or screen saver begins:
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0


# Save screenshots to ~/Screenshots:
mkdir -p "${HOME}/Screenshots"
defaults write com.apple.screencapture location -string "${HOME}/Screenshots"

# Save screenshots in PNG format (other options: BMP, GIF, JPG, PDF, TIFF):
defaults write com.apple.screencapture type -string "png"

# Enable subpixel font rendering on non-Apple LCDs:
defaults write NSGlobalDomain AppleFontSmoothing -int 2

# General: enable HiDPI display modes (requires restart)
#sudo defaults write /Library/Preferences/com.apple.windowserver DisplayResolutionEnabled -bool false

############################################################################
# Dock, Dashboard, and hot corners                                         #
############################################################################

# Set the icon size of Dock items to 48 pixels:
defaults write com.apple.dock tilesize -int 48

# Dock: minimize windows into their application's icon:
defaults write com.apple.dock minimize-to-application -bool true

# Speed up Mission Control animations:
defaults write com.apple.dock expose-animation-duration -float 0.1

# Hot corners
# Possible values:
#  0: no-op
#  2: Mission Control
#  3: Show application windows
#  4: Desktop
#  5: Start screen saver
#  6: Disable screen saver
#  7: Dashboard
# 10: Put display to sleep
# 11: Launchpad
# 12: Notification Center
# Run the display to sleep if we're in the bottom-left hot corner:
defaults write com.apple.dock wvous-bl-corner -int 10
defaults write com.apple.dock wvous-bl-modifier -int 0

# Dock: make icons of hidden applications translucent
defaults write com.apple.dock showhidden -bool true

############################################################################
# Safari                                                                   #
############################################################################

# Set up Safari for development:
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari "com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled" -bool true
defaults write NSGlobalDomain WebKitDeveloperExtras -bool true
