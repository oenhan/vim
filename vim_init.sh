#!/bin/bash

basepath=$(pushd `dirname $0` > /dev/null; pwd; popd > /dev/null)

rm -fr ~/.vim
ln -sf ${basepath} ~/.vim
ln -sf ~/.vim/vimrc ~/.vimrc

if [ ! -f "${basepath}/autoload/plug.vim" ];then
    curl -fLo ${basepath}/vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi
