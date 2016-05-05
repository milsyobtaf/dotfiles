# list out apps installed by homebrew
alias brews='brew list'

# list of all out of date homebrew apps
alias brewu='brew outdated'

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

# reload zsh config
alias reload='source ~/.zshrc'

# run multitail -c
alias tailc='multitail -c'

# make local mysql a bit easier
alias devsql='mysql -uroot -ppassword'

# shortcut to display file sizes in terminal
alias sizes="du -sh * | sort -n"

# because i keep forgetting
alias subl='atom'

