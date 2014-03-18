# Installing configs

You can manually copy the files / create symlinks into the corresponding locations or you can use a tool to help you with that.  

## Introducing Stow

Stow (and it's fork XStow) is a symlink farm manager.  
Stow has the concept of packages, where a package is a folder that includes an installation image.  
An installation image is the layout of files & folders that you want to be symlinked *as is* in a target directory.  
Take for example the `tmux` package in this repo. It contains `.tmux.conf` and `bin/uptime.sh`.  
If we install the `tmux` package in our home folder, we will have symlinks looking like this:

    ~/.tmux.conf -> dotfiles/tmux/.tmux.conf
    ~/bin/uptime.sh -> ../dotfiles/tmux/bin/uptime.sh

If you want to read up on how Stow deals with multiple packages that include a common folder, check the [official documentation](http://www.gnu.org/software/stow/manual/stow.html#Installing-Packages).  
TLDR version: It just works.

### Using Stow

Using Stow in it's simplest form is as easy as:

    git clone https://github.com/freestyl3r/dotfiles.git
    cd dotfiles
    stow tmux

Symlinks will be created in the current's working directory parent folder. If you opted to clone the repository in your home folder, you don't need anything else.  
You can explicitly specify a target directory like so:

    stow -t ~ tmux

Stow will **not** overwrite files already present in your filesystem. If a collision is found while creating the symlinks, everything will be reverted and **no** changes will be made.  
Use the verbose flag for more info:

    stow -v tmux

Stow provides a flag to quickly remove all symlinks installed by a package:

    stow -v -D tmux
