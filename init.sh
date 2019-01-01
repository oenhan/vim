#!/bin/bash

basepath=$(pushd `dirname $0` > /dev/null; pwd; popd > /dev/null)

yum install -y http://mirror.ghettoforge.org/distributions/gf/el/7/plus/x86_64//vim-enhanced-8.0.003-1.gf.el7.x86_64.rpm http://mirror.ghettoforge.org/distributions/gf/el/7/plus/x86_64//vim-filesystem-8.0.003-1.gf.el7.x86_64.rpm http://mirror.ghettoforge.org/distributions/gf/el/7/plus/x86_64//vim-X11-8.0.003-1.gf.el7.x86_64.rpm http://mirror.ghettoforge.org/distributions/gf/el/7/plus/x86_64//vim-common-8.0.003-1.gf.el7.x86_64.rpm http://mirror.ghettoforge.org/distributions/gf/el/7/plus/x86_64//vim-minimal-8.0.003-1.gf.el7.x86_64.rpm

curl -fLo ${basepath}/vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

ln -sf ${basepath}/vim ~/.vim
ln -sf ~/.vim/vimrc ~/.vimrc
