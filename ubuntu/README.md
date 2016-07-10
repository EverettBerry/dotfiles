# dotfiles
Configuration files

# Steps to setup on fresh machine (Ubuntu)
1. sudo apt-get install zsh tmux xclip
1. compile vim from source without python2, follow: https://github.com/Valloric/YouCompleteMe/wiki/Building-Vim-from-source, then
```bash
cd ~
git clone https://github.com/vim/vim.git
cd vim
./configure --with-features=huge \
            --enable-multibyte \
            --enable-python3interp \
            --with-python3-config-dir=/usr/lib/python3.4/config-python3.4m-x86_64-linux-gnu \
            --enable-gui=gtk2 --enable-cscope --prefix=/usr
make VIMRUNTIMEDIR=/usr/share/vim/vim74
sudo make install
```
2. chsh (change shell, enter pw, zsh is /usr/bin/zsh for linux)
2. log out for zsh shell change to take effect
3. wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O - | sh
4. git clone everettberry/dotfiles.git
5. ln -s dotfiles/ubuntu/.vimrc .vimrc
5. rm .zshrc
6. ln -s dotfiles/.zshrc .zshrc
7. ln -s dotfiles/ubuntu/.tmux.conf .tmux.conf
7. mkdir .vim && mkdir .vim/bundle
8. git clone https://github.com/gmarik/vundle ~/.vim/bundle/Vundle.vim 
9. (In vim) :BundleInstall! or (command line) vim +BundleInstall
10. git config --global push.default simple
11. git config --global core.editor vim
12. apt-get install gnome-tweak-tool (change CAPS to ESC under 'typing' tab)
13. git clone https://github.com/anthony25/gnome-terminal-colors-solarized.git
14. install colors with ./install.sh inside that dir

## Tmux powerline setup
1. sudo pip install git+git://github.com/Lokaltog/powerline
2. wget https://github.com/Lokaltog/powerline/raw/develop/font/PowerlineSymbols.otf https://github.com/Lokaltog/powerline/raw/develop/font/10-powerline-symbols.conf
3. sudo mv PowerlineSymbols.otf /usr/share/fonts/
4. sudo fc-cache -vf
5. sudo mv 10-powerline-symbols.conf /etc/fonts/conf.d/
6. sudo dpkg-reconfigure fontconfig
7. log out and log in

See this URL for more: http://askubuntu.com/questions/283908/how-can-i-install-and-use-powerline-plugin 

# Problems
1.  Formatting issues when copying from system clipboard to vim running inside tmux and from vim running inside tmux to terminal.  Maybe respect separate buffers?

# Common TMUX commands
1. See this URL for more: https://docs.python.org/2/library/unittest.html#basic-example

# Changing light and dark colorschemes
1. Set background to light in vimrc
2. Change terminal profile to use light or dark (./set_light or ./set_dark)

