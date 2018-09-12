# list out apps installed by homebrew
alias brews='echo -- "brews --------------------" && brew list && echo "-- casks -----------------" && brew cask list'

# list of all out of date homebrew apps
alias brewu='brew outdated'

# open Finder window to current path
alias finder='open -a Finder ./'

# alias ls -la to ll
alias ll='ls -la'

# alias git status -sb to st
alias st='git st'

# always highlight grep search term
alias grep='grep --color=auto'

# pings with 5 packets, not unlimited
alias ping='ping -c 5'

# Dock Spacer on the application side
# Pre-Sierra
# alias dockspacer="defaults write com.apple.dock persistent-apps -array-add '{tile-data={}; tile-type=\"spacer-tile\";}'"
# Sierra
alias dockspacer="defaults write com.apple.dock persistent-apps -array-add '{"tile-type"="spacer-tile";}'; killall Dock"
# Dock Spacer on the other side
# Pre-Sierra
# alias dockspacer-other="defaults write com.apple.dock persistent-others -array-add '{tile-data={}; tile-type=\"spacer-tile\";}'"
# Sierra
alias dockspacer-other="defaults write com.apple.dock persistent-others -array-add '{"tile-type"="spacer-tile";}'; killall Dock"

# DNS flushing for dnsmasq purposes
alias flushdns='dscacheutil -flushcache'

# reload zsh config
alias reload='source ~/.zshrc  && source ~/dotfiles/zsh/zsh-custom/aliases.zsh && source ~/dotfiles/zsh/zsh-custom/functions.zsh'

# run multitail -c
alias tailc='multitail -c'
alias mtail='multitail -c'

# phpunit with colors by default
alias phpunit='phpunit --colors'

# make local mysql a bit easier
alias devsql='mysql -uroot -ppassword'

# shortcut to display file sizes in terminal
alias sizes="du -sh * | sort -n"

# sublime text shortcut
alias subl="sublime"

alias phpstan='docker run -v $PWD:/app --rm phpstan/phpstan'

# better name for https://gist.github.com/brianloveswords/7534169715b5750a892cddcf54c2aa0e
alias tweetgif="gif-from-tweet"

# the following three are from https://remysharp.com/2018/08/23/cli-improved
# ncdu with some prettification
alias du="ncdu --color dark -rr -x --exclude .git --exclude node_modules"

# prettyping with ping limits
alias ping='prettyping -c 5 --nolegend'

# bat for cat purposes
alias cat='bat'

