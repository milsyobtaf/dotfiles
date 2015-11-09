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
