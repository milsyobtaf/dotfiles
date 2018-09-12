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

# Hot gif action
# From https://gist.github.com/brianloveswords/7534169715b5750a892cddcf54c2aa0e
video-url-from-tweet() {
    if [ "$1" ]; then
        url=$1
    else
        echo "Must provide a url"
        return 1
    fi

    curl --silent $url |\
        # should find the <meta> tag with content="<thumbnail url>"
        (grep -m1 "tweet_video_thumb" ||\
          echo "Could not find video" && return 1) |\

        # from: <meta property="og:image" content="https://pbs.twimg.com/tweet_video_thumb/xxxxxxxxxx.jpg">
        # to: https://pbs.twimg.com/tweet_video_thumb/xxxxxxxxxx.jpg
        cut -d '"' -f 4 |\

        # from: https://pbs.twimg.com/tweet_video_thumb/xxxxxxxxxx.jpg
        # to: https://video.twimg.com/tweet_video/xxxxxxxxxx.mp4
        sed 's/.jpg/.mp4/g' |\
        sed 's/pbs.twimg.com\/tweet_video_thumb/video.twimg.com\/tweet_video/g'
}
video-from-tweet() {
    if [ "$1" ]; then
        url=$1
    else
        echo "Must provide a url"
        return 1
    fi
    curl $(video-url-from-tweet $url)
}
video-to-gif() {
    # derived from https://engineering.giphy.com/how-to-make-gifs-with-ffmpeg/
    if [ "$2" ]; then
        input=$1
        output=$2
    else
        echo "Must provide an input file and output file"
        return 1
    fi

    ffmpeg -i $input \
           -filter_complex "[0:v] split [a][b];[a] palettegen [p];[b][p] paletteuse" \
           -f gif \
           $output
}
gif-from-tweet() {
    if [ "$2" ]; then
        url=$1
        output=$2
    else
        echo "Must provide a url and an output filename"
        return 1
    fi
    video-from-tweet $url | video-to-gif - $output
}
