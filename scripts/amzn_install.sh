sudo chsh ubuntu -s /usr/bin/zsh
wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O - | sh
mkdir .vim
mkdir .vim/bundle
ln -s dotfiles/ubuntu/.vimrc .vimrc
ln -s dotfiles/.zshrc .zshrc
git clone https://github.com/gmarik/vundle ~/.vim/bundle/Vundle.vim 
git config --global push.default simple
git config --global core.editor vim
git clone https://github.com/anthony25/gnome-terminal-colors-solarized.git
./gnome-terminal-colors-solarized/install.sh
vim +BundleInstall
