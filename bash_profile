# prepares powerline-shell usage
function _update_ps1() {
   export PS1="$(~/.powerline-shell.py $?)"
}

#enables powerline-shell
export PROMPT_COMMAND="_update_ps1"

#fixes path issue for homebrew
homebrew=/usr/local/bin:/usr/local/sbin
export PATH=$homebrew:$PATH

#enables color in the terminal bash shell export
export CLICOLOR=1

#sets up the color scheme for list export
export LSCOLORS=gxfxcxdxbxegedabagacad

#sets up the prompt color (currently a green similar to linux terminal)
#export PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;36m\]\w\[\033[00m\]\$ '

#enables color for iTerm
export TERM=xterm-color

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

# If fortune is installed, run a fortune
if [ -e /usr/local/bin/fortune ]; then
    fortune -so
    echo " "
fi

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
