#!/usr/bin/env zsh

echo "\n<<< Starting macOS Setup >>>\n"

# Close any open System Preferences panes, to prevent them from overriding
# settings we’re about to change
osascript -e 'tell application "System Preferences" to quit'

#
# Values pulled from https://macos-defaults.com
#

# Activity Monitor > Update Frequency
defaults write com.apple.ActivityMonitor "UpdatePeriod" -int "1"

# Desktop > Keep Folders on Top
defaults write com.apple.finder "_FXSortFoldersFirstOnDesktop" -bool "true"

# Dock > Icon Size
defaults write com.apple.dock "tilesize" -int "40"

# Dock > Minimize Animation Effect
defaults write com.apple.dock "mineffect" -string "suck"

# Dock > Show Recents
defaults write com.apple.dock "show-recents" -bool "false"

# Finder > Changing File Extension Warning
defaults write com.apple.finder "FXEnableExtensionChangeWarning" -bool "false"

# Finder > Empty Trash After 30 Days
defaults write com.apple.finder "FXRemoveOldTrashItems" -bool "true" &&

# Finder > Keep Folders on Top
defaults write com.apple.finder "_FXSortFoldersFirst" -bool "true"

# Finder > Save to Documents by Default
defaults write NSGlobalDomain "NSDocumentSaveNewDocumentsToCloud" -bool "false"

# Finder > Show Extensions
defaults write NSGlobalDomain "AppleShowAllExtensions" -bool "true"

# Finder > Show Path Bar
defaults write com.apple.finder "ShowPathbar" -bool "true"

# Finder > Quit
defaults write com.apple.finder "QuitMenuItem" -bool "true"

# Mission Control > Rearrange Automatically
defaults write com.apple.dock "mru-spaces" -bool "false"

# Safari > Show Full URL
defaults write com.apple.safari "ShowFullURLInSmartSearchField" -bool "true"

# Screenshots > Set Location
defaults write com.apple.screencapture "location" -string "~/Pictures/screenshots"

# Time Machine > Offer New Disks for Time Machine Backup
defaults write com.apple.TimeMachine "DoNotOfferNewDisksForBackup" -bool "true" 

#
# Extras from https://github.com/mathiasbynens/dotfiles
#

##########
# Energy #
##########

# Sleep the display after 10 minutes
sudo pmset -a displaysleep 10

# Disable machine sleep while charging
sudo pmset -c sleep 0

# Set machine sleep to 15 minutes on battery
sudo pmset -b sleep 15

##########
# Screen #
##########

# Enable subpixel font rendering on non-Apple LCDs
# Reference: https://github.com/kevinSuttle/macOS-Defaults/issues/17#issuecomment-266633501
defaults write NSGlobalDomain AppleFontSmoothing -int 1

##########
# Finder #
##########

# Set Desktop as the default location for new Finder windows
# For other paths, use `PfLo` and `file:///full/path/here/`
defaults write com.apple.finder NewWindowTarget -string "PfLo"
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/"

# Avoid creating .DS_Store files on network or USB volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# Disable the warning before emptying the Trash
defaults write com.apple.finder WarnOnEmptyTrash -bool false

# Speed up Mission Control animations
defaults write com.apple.dock expose-animation-duration -float 0.1

##########
# Safari #
##########

# Privacy: don’t send search queries to Apple
defaults write com.apple.Safari UniversalSearchEnabled -bool false
defaults write com.apple.Safari SuppressSearchSuggestions -bool true

# Prevent Safari from opening ‘safe’ files automatically after downloading
defaults write com.apple.Safari AutoOpenSafeDownloads -bool false

# Enable Safari’s debug menu
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true

# Enable the Develop menu and the Web Inspector in Safari
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true

# Add a context menu item for showing the Web Inspector in web views
defaults write NSGlobalDomain WebKitDeveloperExtras -bool true

# Enable continuous spellchecking
defaults write com.apple.Safari WebContinuousSpellCheckingEnabled -bool true
# Disable auto-correct
defaults write com.apple.Safari WebAutomaticSpellingCorrectionEnabled -bool false

# Disable AutoFill
defaults write com.apple.Safari AutoFillFromAddressBook -bool false
defaults write com.apple.Safari AutoFillPasswords -bool false
defaults write com.apple.Safari AutoFillCreditCardData -bool false
defaults write com.apple.Safari AutoFillMiscellaneousForms -bool false

# Warn about fraudulent websites
defaults write com.apple.Safari WarnAboutFraudulentWebsites -bool true

# Enable “Do Not Track”
defaults write com.apple.Safari SendDoNotTrackHTTPHeader -bool true

# Update extensions automatically
defaults write com.apple.Safari InstallExtensionUpdatesAutomatically -bool true

########
# Mail #
########

# Copy email addresses as `foo@example.com` instead of `Foo Bar <foo@example.com>` in Mail.app
defaults write com.apple.mail AddressesIncludeNameOnPasteboard -bool false

############
# Terminal #
############

# Only use UTF-8 in Terminal.app
defaults write com.apple.terminal StringEncodings -array 4

########
# Misc #
########

# Prevent Photos from opening automatically when devices are plugged in
defaults -currentHost write com.apple.ImageCapture disableHotPlug -bool true

# iTerm2 Settings
defaults write com.googlecode.iterm2 LoadPrefsFromCustomFolder -bool true
defaults write com.googlecode.iterm2 PrefsCustomFolder -string "~/.dotfiles/config/iterm2"
defaults write com.googlecode.iterm2 NoSyncNeverRemindPrefsChangesLostForFile -bool true

killall Finder
killall Dock
killall Terminal
