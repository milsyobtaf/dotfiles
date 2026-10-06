# Set up homebrew environment, before plugins so homebrew-installed completions are on fpath
eval "$(/opt/homebrew/bin/brew shellenv)"

# Load plugins with antidote (~/.zsh_plugins.txt)
source /opt/homebrew/opt/antidote/share/antidote/antidote.zsh
antidote load

# Use emacs keybindings, zsh defaults to vi mode when EDITOR contains "vi"
# must come after antidote load, zsh-utils editor resets keybindings with `bindkey -d`
# vi mode also makes zsh-utils editor switch the cursor to a beam
bindkey -e

# history-substring-search needs explicit arrow-key bindings
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

# Add Homebrew to $PATH
export PATH="/opt/homebrew/bin:$PATH"
export PATH="/opt/homebrew/sbin:$PATH"

# Fix ll / coreutils / gnu-utility issue
# https://github.com/sorin-ionescu/prezto/issues/966#issuecomment-172003005
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"

# Set eza config directory for color themes
export EZA_CONFIG_DIR="$HOME/.config/eza"

# Preferred editor for local and remote sessions
# currently they are the same, but not always
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='vim'
  export VISUAL='nova'
fi

# Set $BROWSER to 'Choosy' to force storybook to respect a friggin' default
export BROWSER='Choosy'

# If fortune is installed, run a fortune
if command -v fortune &> /dev/null; then
    echo " "
    printf '%.s-' $(seq 1 $(tput cols))
    echo ✨🔮✨ $(fortune -s)
    printf '%.s-' $(seq 1 $(tput cols))
    echo " "
fi

# Ignore certain paths in CD
export FIGNORE="Application Scripts:ScriptingAdditions"

# Remove hyphen as part of words
# https://gist.github.com/anchor/4076792
autoload -U select-word-style
select-word-style bash

# fix for 'Error opening terminal: xterm-ghostty.' error
# https://vninja.net/2024/12/28/ghostty-workaround-for-missing-or-unsuitable-terminal-xterm-ghostty/
if [[ "$TERM_PROGRAM" == "ghostty" ]]; then
    export TERM=xterm-256color
fi

### Functions ###

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

# git extra features
# from https://stackoverflow.com/a/73756647
# - clone + cd
function git() {
    if [ $1 = "clone" ]
    then
        command git $@ && cd "$(basename "$_" .git)"
    else
        command git $@
    fi
}

### Aliases ###
# list out apps installed by homebrew
alias brews='brew list'

# list of all globally installed npm apps
alias npms='npm list -g --depth 0'

# open Finder window to current path
alias finder='open -a Finder ./'

# alias for ls, ll, tree using eza.rocks
alias ls="eza --icons=always"
alias ll="eza -alh  --icons=always"
alias tree="eza --tree  --icons=always"

# always highlight grep search term
alias grep='grep --color=auto'

# Dock Spacer on the application side
# Sierra
alias dockspacer="defaults write com.apple.dock persistent-apps -array-add '{"tile-type"="spacer-tile";}'; killall Dock"

# Dock Spacer on the other side
# Sierra
alias dockspacer-other="defaults write com.apple.dock persistent-others -array-add '{"tile-type"="spacer-tile";}'; killall Dock"

# DNS flushing for dnsmasq purposes
alias flushdns='dscacheutil -flushcache'

# reload zsh config
alias reload='exec zsh'

# run multitail -c
alias tailc='multitail -c'
alias mtail='multitail -c'

# force mtr to be sudo-run
if command -v mtr &> /dev/null; then
  alias mtr='sudo mtr -t'
fi

# the following three are from https://remysharp.com/2018/08/23/cli-improved
# ncdu with some prettification
alias du="ncdu --color dark -rr -x --exclude .git --exclude node_modules"

# prettyping with ping limits
alias ping='prettyping -c 5 --nolegend'

# muscle memory alias for moving from silver searcher to ripgrep
alias ag='rg'

# bat for cat purposes
if command -v bat &> /dev/null; then
  alias cat='bat'
fi

# Quick Look a file from Terminal
alias ql="qlmanage -px &>/dev/null"

# next 4 from https://brettterpstra.com/2019/08/29/shell-tricks-a-random-selection/
# copy the working directory path
alias cpwd='pwd|tr -d "\n"|pbcopy'
alias pwdcopy='pwd|tr -d "\n"|pbcopy'

alias gitmine="git status|grep -e '^U'|sed -e 's/^UU *//'|xargs git checkout --ours"
alias gittheirs="git status|grep -e '^U'|sed -e 's/^UU *//'|xargs git checkout --theirs"

# retrieve current external ip
alias myip='curl -4 https://icanhazip.com'

# weather and the moon from @noopkat
alias weather='curl -4 https://wttr.in/Boxborough\?format\="%l:+%c+%t+%m\n"'
alias moon='curl -4 https://wttr.in/Moon'

# Enabled zoxide with the cd alias
if command -v zoxide &> /dev/null; then
  eval "$(zoxide init --cmd cd zsh)"
fi

# autoload ssh keys
if command -v ssh-add &> /dev/null && [[ "$(ssh-add -l)" == "The agent has no identities." ]]; then
  ssh-add --apple-load-keychain 2> /dev/null
fi

# AMZN stuff

[[ "$TERM_PROGRAM" == "kiro" ]] && . "$(kiro --locate-shell-integration-path zsh)"

# Amazon toolbox app
export PATH=$HOME/.toolbox/bin:$PATH

# Added by AIM CLI
export PATH="$HOME/.aim/mcp-servers:$PATH"

brazil-clone() {
  brazil ws create --name $1 && cd $1 && brazil ws use --package $1
}

# end AMZN stuff

# mise wants to be last so it's first in $PATH
unset __MISE_ORIG_PATH
if command -v mise &> /dev/null; then
  eval "$(mise activate zsh)" # added by https://mise.run/zsh
fi

# autocompletions for zsh
fpath=(~/.zfunc $fpath)
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
autoload -Uz compinit && compinit

# prevent $PATH dupes
typeset -U path PATH
