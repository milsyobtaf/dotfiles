# cd to the path of the front Finder window
cdf() {
  target=`osascript -e 'tell application "Finder" to if (count of Finder windows) > 0 then get POSIX path of (target of front Finder window as text)'`
  if [ "$target" != "" ]; then
    cd "$target"; pwd
  else
    echo 'No Finder window found' >&2
  fi
}

# open a specified man page in Preview
man-preview() {
  man -t "$@" | open -f -a Preview
}

# move a specified file to the OSX Trash
trash() {
  local trash_dir="${HOME}/.Trash"
  local temp_ifs=$IFS
  IFS=$'\n'
  for item in "$@"; do
    if [[ -e "$item" ]]; then
      item_name="$(basename $item)"
      if [[ -e "${trash_dir}/${item_name}" ]]; then
        mv -f "$item" "${trash_dir}/${item_name} $(date "+%H-%M-%S")"
      else
        mv -f "$item" "${trash_dir}/"
      fi
    fi
  done
  IFS=$temp_ifs
}

# shortcut to get figlet text for IRC, etc
shout() {
  figlet "$@" | pbcopy
}

# list out apps installed by homebrew
alias brews='brew list'

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

# old drush instead of new drush
alias drush7='/usr/local/Cellar/drush/7.0.0/bin/drush'

