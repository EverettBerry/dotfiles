# dotfiles
Configuration files

# Steps to setup on fresh machine (Ubuntu)
1. apt-get install zsh
2. apt-get install tmux
2. apt-get install xclip
2. chsh (change shell, enter pw, zsh is /usr/bin/zsh for linux)
2. log out for zsh shell change to take effect
3. wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O - | sh
4. git clone everettberry/dotfiles.git
5. ln -s dotfiles/.vimrc .vimrc
5. rm .zshrc
6. ln -s dotfiles/.zshrc .zshrc
7. ln -s dotfiles/ubuntu/.tmux.conf .tmux.conf
7. mkdir .vim && mkdir .vim/bundle
8. git clone https://github.com/gmarik/vundle ~/.vim/bundle/Vundle.vim 
8. brew install vim (may have to do this - should be 7.4)
9. (In vim) :BundleInstall! or (command line) vim +BundleInstall
10. git config --global push.default simple
11. git config --global core.editor vim
12. apt-get install gnome-tweak-tool (change CAPS to ESC under 'typing' tab)
13. git clone https://github.com/anthony25/gnome-terminal-colors-solarized.git
14. install colors with ./install.sh inside that dir

# Problems
1. I think the zsh config script auto sets the PATH which may make it wrong in some cases - check the PATH in the .zsrhc if there are problems
2. Copy mode is kinda fucked - just need to figure out how to use it properly
3. Switching light vs dark colors is kinda screwy too, improve this a little

# Common TMUX commands
1. Resize windows with keyboard: CTRL B + ALT <arrow key>
2. See this URL for more: https://docs.python.org/2/library/unittest.html#basic-example

# Changing light and dark colorschemes
1. Set background to light in vimrc
2. Change terminal profile to use light or dark (./set_light or ./set_dark)

