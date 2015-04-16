# dotfiles
Configuration files

# Steps to setup on fresh machine
1. apt-get (or brew) install zsh
2. apt-get (or brew) install tmux
3. wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O - | sh
4. git clone everettberry/dotfiles.git
5. ln -s dotfiles/.vimrc .vimrc
6. ln -s dotfiles/.zshrc .zshrc
7. ln -s dotfiles/.tmux.conf .tmux.conf
7. mkdir .vim && mkdir .vim/bundle
8. git clone https://github.com/gmarik/vundle ~/.vim/bundle/Vundle.vim  
9. (In vim) :BundleInstall! or (command line) vim +BundleInstall

# Problems
1. I think the zsh config script auto sets the PATH which may make it wrong in some cases - check the PATH in the .zsrhc if there are problems
2. The default theme (light solarized vs. dark) is wrong on linux systems (something to do with GNOME terminal settings.  The result is that you have to use f5 to change to the correct setting in vim
3. Copy mode is kinda fucked - just need to figure out how to use it properly

# Common TMUX commands
1. Resize windows with keyboard: CTRL B + ALT <arrow key> (something extra required on Mac) 
