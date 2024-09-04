# dotfiles

![wip](https://github.com/user-attachments/assets/502fb1b0-79e5-457a-b3ff-534c887aff40)



### zsh setup
Sets up zsh with oh-my-zsh

1. sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
2. git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
4. git clone https://github.com/Aloxaf/fzf-tab ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/fzf-tab
4. cp ~/dotfiles/zsh/themes/blazz.zsh-theme ~/.oh-my-zsh/theme
5. cp /home/lukas/clones/dotfiles/zsh/zshrc /home/lukas/.zshr
6. `sudo pacman -Syu openssh keychain`
7. `ssh-keygen -t ed2551`
8. `stow zsh`
