# dotfiles repo

gettin' all dotfiled up in here

## install all the things

`brew` can now manage regular packages through `brew`, app store apps through `mas`, and vs code plugins. there are separate brewfiles for each machine, because of different needs.

### install brew

`/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`

### install the stuff

`brew bundle install --file=correctBrewFileHere`

## stow

i'm now using `stow` to manage the symlinking mishegas. it's weird, but works a treat.

### add symlinks

`stow --stow --target $HOME .`

### remove symlinks

`stow --delete --target $HOME .`

### refresh symlinks

`stow --restow --target $HOME .`

## zsh setup

`git submodule update --init --recursive`

this installs all of the submodules we need, currently `.zprezto` and `/zsh/eza-themes`.

## vim setup

- `vim`
- `PlugInstall`
- `PlugCleanup`

this installs any defined plugins and cleans up any cruft.

### notes:

- don't add ssh keys into `dotfiles/.ssh`, add them into `$HOME/.ssh` so they aren't picked up by `git`
- https://archive.is/ZL2gt
  - https://web.archive.org/web/20241008102622/https://medium.com/@protiumx/bash-gnu-stow-take-a-walk-while-your-new-macbook-is-being-set-up-351a6f2f9225
- https://archive.is/TZ8Iw
  - https://web.archive.org/web/20250723093511/https://tamerlan.dev/how-i-manage-my-dotfiles-using-gnu-stow/
- https://www.youtube.com/watch?v=y6XCebnB9gs

## various macos fixes

### put application switcher on multiple screens

```sh
defaults write com.apple.Dock appswitcher-all-displays -bool true
killall Dock
```

