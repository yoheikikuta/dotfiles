##################################################
# keyboard settings
##################################################
# Need to set modifiremapping of your machine
modifiermapping="com.apple.keyboard.modifiermapping.1452-641-0"
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
