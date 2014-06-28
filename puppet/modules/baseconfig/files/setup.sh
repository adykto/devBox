echo "Loading setup!"

mkdir -p ~/.vim/autoload ~/.vim/bundle
curl https://gist.githubusercontent.com/adykto/5544806/raw/22fb8ef9fece48d656fa9a03d3186dcd8deb7f70/.vimrc > ~/.vimrc
curl https://raw.githubusercontent.com/tpope/vim-pathogen/master/autoload/pathogen.vim > ~/.vim/autoload/pathogen.vim
cd ~/.vim/bundle
git clone git://github.com/tpope/vim-fugitive.git
git clone git://github.com/scrooloose/nerdtree.git
git clone git://github.com/airblade/vim-gitgutter.git
git clone git://github.com/majutsushi/tagbar.git
git clone git://github.com/Raimondi/delimitMate.git
git clone git://github.com/tpope/vim-sensible.git
git clone https://github.com/Lokaltog/vim-distinguished
