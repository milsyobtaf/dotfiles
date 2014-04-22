# cd to the path of the front Finder window
cdf() {
  target=`osascript -e 'tell application "Finder" to if (count of Finder windows) > 0 then get POSIX path of (target of front Finder window as text)'`
  if [ "$target" != "" ]; then
    cd "$target"; pwd
  else
    echo 'No Finder window found' >&2
  fi
}

# open Finder window to current path
alias finder='open -a Finder ./'

# alias ls -la to ll
alias ll='ls -la'

# always highlight grep search term
alias grep='grep --color=auto'

# pings with 5 packets, not unlimited
alias ping='ping -c 5'

# Dock Spacer on the application side
alias dockspacer="defaults write com.apple.dock persistent-apps -array-add '{tile-data={}; tile-type=\"spacer-tile\";}'"

# Dock Spacer on the other side
alias dockspacer-other="defaults write com.apple.dock persistent-others -array-add '{tile-data={}; tile-type=\"spacer-tile\";}'"

# DNS flushing for dnsmasq purposes
alias flushdns='dscacheutil -flushcache'
