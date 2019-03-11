set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Let Vundle manage Vundle - required!
Plugin 'VundleVim/Vundle.vim'

" NerdTree
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'

" show git status in editor
Plugin 'airblade/vim-gitgutter'

" Configuurable statusline and tabline
Plugin 'itchyny/lightline.vim'

call vundle#end()            " required
filetype plugin indent on    " required
