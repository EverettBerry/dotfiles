# Git configuration (assumes git installed)
git config --global push.default simple
git config --global core.editor vim
git config --global user.name "Everett Berry"
git config --global user.email "everettpberry@gmail.com"
git clone https://github.com/anthony25/gnome-terminal-colors-solarized.git

# Vim configuration
mkdir -p ~/.vim/bundle
ln -s ~/dotfiles/ubuntu/.vimrc ~/.vimrc
git clone https://github.com/gmarik/vundle ~/.vim/bundle/Vundle.vim 
./gnome-terminal-colors-solarized/install.sh
vim +BundleInstall +qall
sudo apt-get install -y cmake
python ~/.vim/bundle/youcompleteme/install.py --clang-completer

# Shell configuration
sudo apt-get install -y zsh
wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O - | sh
rm ~/.zshrc
ln -s ~/dotfiles/.zshrc ~/.zshrc
sudo chsh ubuntu -s /usr/bin/zsh
