#!/bin/bash

basepath=$(pushd `dirname $0` > /dev/null; pwd; popd > /dev/null)

if [ ! -f "/etc/yum.repos.d/vim-latest.repo" ];then
    sudo curl -L https://copr.fedorainfracloud.org/coprs/lantw44/vim-latest/repo/epel-7/lantw44-vim-latest-epel-7.repo -o /etc/yum.repos.d/vim-latest.repo
    sudo yum update -n
    sudo yum install vim-enhanced global-ctags ShellCheck -y
fi

if [ ! -f "${basepath}/autoload/plug.vim" ];then
    curl -fLo ${basepath}/vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

rm -fr ~/.vim
ln -sf ${basepath} ~/.vim
ln -sf ~/.vim/vimrc ~/.vimrc

vim << EOF
:PlugUpdate
:q
:q
EOF
