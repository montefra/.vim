# ``.vim`` directory from Francesco Montesano

This repository contains ``.vimrc`` file and a number of vim files to customize
and add some functionalities.

## Install

To use the ``.vim`` first clone the repository in your home directory:

    cd $HOME
    git clone https://github.com/montefra/.vim.git

then symlink the ``.vimrc`` file from the ``.vim`` to the home directory:

    cd .vim
    ln -s .vimrc ../

To managed the plugins I use
[``vim-plug``](https://github.com/junegunn/vim-plug). ``vim-plug`` will be
fetched and the plugins installed the first time you open vim.

### Installed plugins

    " load always
    Plug 'tpope/vim-fugitive'
    Plug 'vim-scripts/svnj.vim'
    Plug 'vim-latex/vim-latex'
    Plug 'ervandew/supertab'
    Plug 'scrooloose/syntastic'
    Plug 'szw/vim-ctrlspace'
    Plug 'bling/vim-airline'

    " On-demand loading
    " action
    Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
    Plug 'mbbill/undotree', { 'on':  'UndotreeToggle' }
    Plug 'AndrewRadev/linediff.vim', { 'on':  'Linediff' }
    Plug 'godlygeek/tabular', { 'on':  'Tabularize' }

    " file type
    Plug 'Rip-Rip/clang_complete', { 'for': ['c', 'cpp'] }
    Plug 'Glench/Vim-Jinja2-Syntax', { 'for':  'jinja' }
    Plug 'suan/vim-instant-markdown', { 'for':  'markdown' }
    Plug 'plasticboy/vim-markdown'  " , { 'for':  'markdown' } 
    Plug 'tmhedberg/SimpylFold', { 'for':  'python' }
    Plug 'davidhalter/jedi-vim', { 'for':  'python' }
    Plug 'Matt-Deacalion/vim-systemd-syntax', { 'for':  'systemd' }
    Plug 'vim-scripts/CountJump', { 'for':  'tex' }

## LICENSE

Unless otherwise stated, all the code written by me is released with the 
[MIT license](LICENSE). I've tried to acknowledge code copied from the internet.
