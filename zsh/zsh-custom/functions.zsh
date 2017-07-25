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

# quick aliases / functions for getting around the file system
# jump quickly to subfolders in the www directory
www() {
  cd $HOME/www/"$@"
}

# notify on completion, from http://frantic.im/notify-on-completion
function f_notifyme {
  LAST_EXIT_CODE=$?
  CMD=$(fc -ln -1)
  # No point in waiting for the command to complete
  notifyme "$CMD" "$LAST_EXIT_CODE" &
}
# inject this function in front of every command 
export PS1='$(f_notifyme)'$PS1

# git clone and cd into the new directory
# https://gist.github.com/natchiketa/6026183
function clone() {
  cd $HOME/Github
	REPONAME=$(node -e "console.log(process.argv[1].match(/.*?\/([a-zA-Z0-9\-]+).git/)[1]);" $1)
	git clone $1 && cd "${REPONAME}"
}

# BZ custom code sniffer command 
function bzcs () {
  ./vendor/bin/phpcs --standard=./vendor/drupal/coder/coder_sniffer/Drupal/ruleset.xml --extensions=php,module,inc,install,test,profile,theme,js,css,info,txt,md "$1"
}

# Acquia BLT
function blt() {
  if [ "`git rev-parse --show-cdup 2> /dev/null`" != "" ]; then
    GIT_ROOT=$(git rev-parse --show-cdup)
  else
    GIT_ROOT="."
  fi

  if [ -f "$GIT_ROOT/vendor/bin/blt" ]; then
    $GIT_ROOT/vendor/bin/blt "$@"
  else
    echo "You must run this command from within a BLT-generated project repository."
    return 1
  fi
}
