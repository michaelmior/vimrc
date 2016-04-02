# vimrc

This is my personal vim configuration.
In an effort to make it potentially usable by others, some basic installation steps are given below.

## Installation

    # Clone the repository into the correct directory
    git clone --recursive https://github.com/michaelmior/vimrc ~/.vim

    # Create a necessary symlink for the main configuration file
    ln -s ~/.vim/vimrc ~/.vimrc

    # Use the plugin manager to install the plugins
    vim -E -u NONE -S ~/.vim/plugins.vim +PlugInstall +qall > /dev/null
