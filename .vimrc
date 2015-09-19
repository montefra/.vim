" Vim configuration file.
"
" Unless otherwise stated:
" Copyright (c) 2015 Francesco Montesano
" The MIT License (MIT)

" use 256 colors
set t_Co=256

" get the distro name {{{
let g:distro = system(". /etc/os-release; echo -n $NAME")
" }}}

" vim-plug settings {{{
" fetch plug.vim is does not exists
" from https://github.com/junegunn/vim-plug/wiki/faq#automatic-installation
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.vim/plugged')

" load always
Plug 'tpope/vim-fugitive'
Plug 'vim-scripts/svnj.vim'
Plug 'ervandew/supertab'
Plug 'scrooloose/syntastic'
Plug 'szw/vim-ctrlspace'
Plug 'bling/vim-airline'
Plug 'mhinz/vim-signify'
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'majutsushi/tagbar'
Plug 'Valloric/MatchTagAlways'
Plug 'ryanoasis/vim-devicons'
Plug 'EinfachToll/DidYouMean'
Plug 'flazz/vim-colorschemes'

" On-demand loading
" action
Plug 'mbbill/undotree', { 'on':  'UndotreeToggle' }
Plug 'AndrewRadev/linediff.vim', { 'on':  'Linediff' }
Plug 'godlygeek/tabular', { 'on':  'Tabularize' }
Plug 'qualiabyte/vim-colorstepper', { 'on': ['<Plug>ColorstepPrev', '<Plug>ColorstepNext'] }

" file type
Plug 'Rip-Rip/clang_complete', { 'for': ['c', 'cpp'] }
" Plug 'Glench/Vim-Jinja2-Syntax', { 'for':  ['jinja', 'html'] }
Plug 'suan/vim-instant-markdown', { 'for':  'markdown' }
Plug 'plasticboy/vim-markdown'  " , { 'for':  'markdown' }
Plug 'tmhedberg/SimpylFold', { 'for':  'python' }
Plug 'davidhalter/jedi-vim', { 'for':  'python' }
Plug 'Matt-Deacalion/vim-systemd-syntax', { 'for':  'systemd' }
Plug 'vim-scripts/CountJump', { 'for':  'tex' }
Plug 'vim-latex/vim-latex', { 'for':  ['tex', 'bib'] }

" keep it for reference, but not install now
" Plug 'sk1418/HowMuch'
" Plug 'salsifis/vim-transpose'
" Plug 'Valloric/YouCompleteMe', { 'do': './install.sh --clang-completer' }
call plug#end()
" }}}

" general configuration options{{{

" add the line number
set number

set hidden

set cursorline

" filetype plugin indent on
" indentation
set autoindent      " indent automatic
"set smartindent     " and smart

" syntax color
let fortran_free_source=1
syntax on

" enable spelling. In codes checks only string and comments
set spell

" set default line width
set textwidth=80

" never use tabs and set default tab to 4 spaces
set expandtab
set tabstop=4
set shiftwidth=4
set shiftround

" disable beep and flash
set vb t_vb=

" enable the ruler at the lower right corner
set ruler

" When a bracket is inserted, briefly jump to the matching one.
set showmatch

" The 'scrolloff' (scroll offset) option determines the number of context
" lines you would like to see above and below the cursor.
set scrolloff=5

" always have status line
set laststatus=2

" save file with old undos so that it is possible to go back in the history
set undofile
"}}}

" When editing a file, always jump to the last cursor position{{{
" from the docs
" http://vimdoc.sourceforge.net/htmldoc/eval.html#last-position-jump
if has("autocmd")
  autocmd BufReadPost *
  \ if line("'\"") > 0 && line ("'\"") <= line("$") |
  \   exe "normal g'\"" |
  \ endif
endif
"}}}

" vim-latex settings {{{
set grepprg=grep\ -nH\ --color\ $*
let g:tex_flavor='latex'
" smart indentation in latex
let g:tex_indent_items = 1
let g:tex_indent_brace = 0
"}}}

" Simply Fold plugin: enable preview {{{
let g:SimpylFold_docstring_preview = 1
"}}}

" undotree map {{{
noremap <F4> :UndotreeToggle<CR>
"}}}

" clang complete setting {{{
if g:distro ==? "Ubuntu"
  let g:clang_library_path=split(expand('/usr/lib/llvm-*/lib/libclang.so*'))[-1]
elseif g:distro ==? "openSUSE"
  " let g:clang_library_path='/usr/lib64'
  let g:clang_complete_loaded=0
endif
let g:clang_use_library=1
let g:clang_complete_copen=1
let g:clang_hl_errors=1
let g:clang_snippets=1
"let g:clang_periodic_quickfix=1
let g:clang_close_preview=1
nnoremap <F7> :call g:ClangUpdateQuickFix() <CR>
imap <F7> <ESC> <F7>
let g:clang_jumpto_declaration_key='<leader>d'
let g:clang_jumpto_declaration_in_preview_key='<leader>dw'
" }}}

" syntastic settings {{{
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 2
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" python
let g:syntastic_python_checkers = ['flake8', 'pep8', 'pyflakes', 'python']
" c++
let g:syntastic_cpp_compiler = 'clang++'
" html
let g:syntastic_html_checkers = ['validator']
" javascript
let g:syntastic_javascript_checkers = ['jshint']
" let g:syntastic_debug = 3
" sphinx
" let g:syntastic_rst_checkers = ['sphinx']


nnoremap <F7> :Errors <CR>
imap <F7> <ESC> <F7>
" }}}

" tagbar settings {{{
nnoremap <F8> :TagbarToggle<CR>
imap <F8> <ESC> <F8>
" }}}

" vim-airline setting {{{
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_close_button = 0
let g:airline#extensions#tabline#show_buffers = 0
" }}}

" ctrlspace settings {{{
" hi link CtrlSpaceNormal Normal                                                                                                     
" hi link CtrlSpaceSelected Visual
"}}}

" non installed {{{
" YouCompleteMe setting {{{
" let g:ycm_global_ycm_extra_conf = './plugged/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
" let g:ycm_goto_buffer_command = 'new-tab'
" let g:ycm_complete_in_comments = 1
" let g:ycm_collect_identifiers_from_comments_and_strings = 1

" noremap <leader>d :YcmCompleter GoTo<CR>
" noremap <leader>dc :YcmCompleter GoToDeclaration<CR>
" noremap <leader>df :YcmCompleter GoToDefinition<CR>
" }}}
" }}}
