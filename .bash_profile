# Setup bash completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  source $(brew --prefix)/etc/bash_completion
fi

# Setup git prompt
if [ -f "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh" ]; then
    source "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh"
fi

# Load dnvm
[ -s "/Users/jameschurchill/.dnx/dnvm/dnvm.sh" ] && . "/Users/jameschurchill/.dnx/dnvm/dnvm.sh"

# Setup aliases to show and hide hidden files
# See http://ianlunn.co.uk/articles/quickly-showhide-hidden-files-mac-os-x-mavericks/
alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'

# Function for starting Visual Studio Code
code () { VSCODE_CWD="$PWD" open -n -b "com.microsoft.VSCode" --args $* ;}

# Function for starting dnx with nodemon for file watching
dnxmon() {
    # Run dnx server continuously with nodemon watching for changes to cs or json files
    # Usage:
    #   dnxmon <directory> <command>
    # dnxmon (applies the defaults: current directory and the "web" command)

    dnxmonFn() {
        nodemon --ext "cs,json" --exec "dnx $1 $2"
    }

    if [[ $# -eq 0 ]]
    then
        echo "running default ..."
        echo "nodemon --ext \"cs,json\" --exec \"dnx kestrel\""
        dnxmonFn kestrel
    else
        if [[ $# -eq 2 ]]
        then
            echo "nodemon --ext \"cs,json\" --exec \"dnx $1 $2\""
            dnxmonFn $1 $2
        else
            echo "must supply directory and command such as dnxmon . kestrel"
        fi
    fi
}
