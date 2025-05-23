# dotfiles

## dotfiles configs for various configurations made using "stow".

### Setup:
-Clone into /home/dotfiles
-Install stow with a package manager
-Delete or rename the same files in home dir that you have in dotfiles dir
-cd into dotfiles and use command "stow ."

You will now have the files in your home dir but they exist as references to the files in dotfiles dir.
Changing the files in home dir will reflect on the files in dotfiles so they can be kept there and saved with git.

### IMPORTANT:
The dotfiles dir has to have the same structure as your home dir.
Example:
If you have a dotfile in home/.config/your_dir/.your_config
Then dotfiles has to look like: dotfiles/.config/your_dir/.your_config


### TMUX (at the moment not used)
-You will have to clone the tmux plugin manager first onto you system for everything to work:
-git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
-Open tmux and click <prefix> + I (Ctrl + b + I)
