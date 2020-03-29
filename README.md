# Dotfiles

My personal configuration files for various programs (Fish, nvim, etc.).

## Instructions

1. Clone this repository and its submodules:
   ```sh
   $ git clone --recurse-submodules https://github.com/jonasdemoor/dotfiles
   ```
2. [GNU Stow](https://www.gnu.org/software/stow/) is used for symlinking things into place:
   ```sh
   $ stow --target=${HOME} --verbose alacritty fish git i3 nvim picom
   ```
   Or run the setup script:
   ```sh
   $ ./setup.sh
   ```
3. Source your `~/.config/fish/config.fish`.
