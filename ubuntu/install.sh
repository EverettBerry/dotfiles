# Git configuration (assumes git installed)
git config --global push.default simple
git config --global core.editor vim
git config --global user.name "Everett Berry"
git config --global user.email "hello.epb@gmail.com"

# Colors
git clone https://github.com/anthony25/gnome-terminal-colors-solarized.git
./gnome-terminal-colors-solarized/install.sh

# Vim configuration
sudo add-apt-repository -y ppa:pi-rho/dev
sudo apt-get update
sudo apt-get install -y vim
mkdir -p ~/.vim/bundle
ln -s ~/dotfiles/ubuntu/.vimrc ~/.vimrc
git clone https://github.com/gmarik/vundle ~/.vim/bundle/Vundle.vim 
vim +BundleInstall +qall
sudo apt-get install -y cmake
python ~/.vim/bundle/youcompleteme/install.py --clang-completer

# Shell configuration
sudo apt-get install -y zsh
ln -s ~/dotfiles/.zshrc ~/.zshrc
ln -s ~/dotfiles/ubuntu/.zshenv ~/.zshenv
sudo chsh $USER -s /usr/bin/zsh

# Tmux
sudo apt-get install -y tmux
ln -s ~/dotfiles/ubuntu/.tmux.conf ~/.tmux.conf
