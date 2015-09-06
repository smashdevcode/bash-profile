
# Load dnvm
[ -s "/Users/jameschurchill/.dnx/dnvm/dnvm.sh" ] && . "/Users/jameschurchill/.dnx/dnvm/dnvm.sh"

# Setup aliases to show and hide hidden files
# See http://ianlunn.co.uk/articles/quickly-showhide-hidden-files-mac-os-x-mavericks/
alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'
