# dotfiles repo

gettin' all dotfiled up in here

## stow

i'm now using `stow` to manage the symlinking mishegas. it's weird, but works a treat.

### add symlinks

`stow --stow --target $HOME .`

### remove symlinks

`stow --delete --target $HOME .`

### refresh symlinks

`stow --restow --target $HOME .`
notes:

- https://archive.is/ZL2gt
  - https://web.archive.org/web/20241008102622/https://medium.com/@protiumx/bash-gnu-stow-take-a-walk-while-your-new-macbook-is-being-set-up-351a6f2f9225
- https://archive.is/TZ8Iw
  - https://web.archive.org/web/20250723093511/https://tamerlan.dev/how-i-manage-my-dotfiles-using-gnu-stow/
- https://www.youtube.com/watch?v=y6XCebnB9gs
