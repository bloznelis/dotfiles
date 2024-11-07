# dotfiles

![wip](https://github.com/user-attachments/assets/502fb1b0-79e5-457a-b3ff-534c887aff40)

### Packages for fresh install
`sudo pacman -Syu neovim, ripgrep, fzf, openssh, keychain, rofi, dunst, bspwm, sxhkd, picom, tmux`

### Link home
`stow home --dotfiles`

### zsh
Sets up zsh with oh-my-zsh

1. `sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"`
2. `git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions`
4. `git clone https://github.com/Aloxaf/fzf-tab ~/.oh-my-zsh/custom/plugins/fzf-tab`
5. `git clone https://github.com/joshskidmore/zsh-fzf-history-search ~/.oh-my-zsh/custom/plugins/zsh-fzf-history-search`
6. `stow home --dotfiles`
7. `sudo pacman -Syu openssh keychain`
8. `ssh-keygen -t ed25519`

### tmux
1. `git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm`
2. open tmux
3. C-b I (to install tmux plugins)
