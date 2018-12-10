# My vimrc file

## Get started

```
# clone this repo
git clone https://github.com/hafeyang/vimfiles.git

# setup vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# clone rc file
cd vimfiles && cp ./.vimrc ~/.vimrc

# install all bundles
vim +PluginInstall +qall

# install the silver searcher (ag) if needed
apt-get install silversearcher-ag

# install global node modules
npm i -g eslint_d prettier --registry=https://registry.npm.taobao.org
```
