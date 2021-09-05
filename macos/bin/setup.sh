##################################################
### Modifier key mapping
##################################################
# Need to set modifiremapping of your machine
modifiermapping="com.apple.keyboard.modifiermapping.1452-641-0"
# caps lock <-> control
defaults -currentHost write -g $modifiermapping -array-add "
<dict>
  <key>HIDKeyboardModifierMappingDst</key>\
  <integer>30064771300</integer>\
  <key>HIDKeyboardModifierMappingSrc</key>\
  <integer>30064771129</integer>\
</dict>
"
defaults -currentHost write -g $modifiermapping -array-add "
<dict>
  <key>HIDKeyboardModifierMappingDst</key>\
  <integer>30064771129</integer>\
  <key>HIDKeyboardModifierMappingSrc</key>\
  <integer>30064771300</integer>\
</dict>
"
defaults -currentHost write -g $modifiermapping -array-add "
<dict>
  <key>HIDKeyboardModifierMappingDst</key>\
  <integer>30064771129</integer>\
  <key>HIDKeyboardModifierMappingSrc</key>\
  <integer>30064771296</integer>\
</dict>
"

##################################################
### General UI/UX  
##################################################
# Disable the sound effects on boot
sudo nvram StartupMute=%01

# Disable auto-correct
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

# Trackpad: enable tap to click for this user and for the login screen
defaults write com.apple.AppleMultitouchTrackpad Clicking -bool true
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
# Trackpad: increase tracking spped
defaults write NSGlobalDomain com.apple.mouse.scaling 0.7

# Finder: show hidden files by default
defaults write com.apple.finder AppleShowAllFiles -bool true

# Finder: show all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Dock: automatically hide and show the Dock
defaults write com.apple.dock autohide -bool true

# HotCorners: lock screen at bottom left
defaults write com.apple.dock wvous-bl-corner -int 13
defaults write com.apple.dock wvous-bl-modifier -int 0

# Keyboard: set a blazingly fast keyboard repeat rate
defaults write NSGlobalDomain KeyRepeat -int 1
defaults write NSGlobalDomain InitialKeyRepeat -int 15
# Keyboard: turn off live conversion
defaults write com.apple.inputmethod.Kotoeri 'JIMPrefLiveConversionKey' -bool false
