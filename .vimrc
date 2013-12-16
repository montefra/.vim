"""""""""""""""""""""""""""""""""
" start pathogen
"""""""""""""""""""""""""""""""""
runtime bundle/pathogen/autoload/pathogen.vim
execute pathogen#infect()
" create help tags
Helptags

"""""""""""""""""""""""""""""""""
" general configuration options
"""""""""""""""""""""""""""""""""
" add the line number
set number   
 
filetype plugin on
" indentation
filetype indent on    " set indent according to the file type
set autoindent      " indent automatic
"set smartindent     " and smart

" syntax color
let fortran_free_source=1
syntax on 

" enable spelling. In codes checks only string and comments
set spell

" never use tabs and set default tab to 2 spaces
set expandtab
set shiftwidth=2
" disable beep and flash
set vb t_vb=        
" enable the ruler at the lower right corner
set ruler

" searching
set showmatch       " when searching enhance the matching
set incsearch       " enable search in the command line
set ignorecase smartcase    " ignore case when searching, but in a smart way

" The 'scrolloff' (scroll offset) option determines the number of context
" lines you would like to see above and below the cursor.
set scrolloff=5

" Only do this part when compiled with support for autocommands
if has("autocmd")
  " When editing a file, always jump to the last cursor position
  autocmd BufReadPost *
  \ if line("'\"") > 0 && line ("'\"") <= line("$") |
  \   exe "normal g'\"" |
  \ endif
endif

" save file with old undos so that it is possible to go back in the history
set undofile

"""""""""""""""""""""""""""""""""
" Set color schemes and other colors
"""""""""""""""""""""""""""""""""
"let distro = system("awk '/^NAME=/ {print $1}' /etc/os-release")
let distro = system(". /etc/os-release; echo -n $NAME")
if distro == "openSUSE"
  "color comments in different color
  highlight Comment ctermfg=lightblue
else
  colorscheme zellner
endif

"status line hightlight. green: current window, red: others windows
hi StatusLine ctermbg=white ctermfg=blue
hi StatusLineNC ctermbg=white ctermfg=red

"""""""""""""""""""""""""""""""""
" vim-latex settings
"""""""""""""""""""""""""""""""""
set grepprg=grep\ -nH\ --color\ $*
let g:tex_flavor='latex'
" smart indentation in latex
let g:tex_indent_items = 1
let g:tex_indent_brace = 0


"maxfuncdepth for user functions
"set maxfuncdepth=300

"""""""""""""""""""""""""""""""""
" setting specific to some file type
" see if it's better to move it somewhere else
"""""""""""""""""""""""""""""""""
if has("autocmd")
  au BufRead,BufNewFile *.tex set tw=80 "maximum textwidth=80 for tex file
  au BufRead,BufNewFile *.py set shiftwidth=4  "four spaces indent for python files
  au BufRead,BufNewFile *.ipy set shiftwidth=4  "four spaces indent for ipython files
  
  " markdown filetype file
  au BufRead,BufNewFile *.{md,mdown,mkd,mkdn,markdown,mdwn}   set filetype=markdown
endif

" Simply Fold plugin: enable preview
let g:SimpylFold_docstring_preview = 1

"""""""""""""""""""""""""""""""""
" custom remapping
"""""""""""""""""""""""""""""""""

"from vim help: If you prefer "cw" to include the space after a word, use this mapping: 
map cw dwi
map cW dWi

"Makes f,F,T and t work across multiple lines
nmap <silent> f :call FindChar(0, 0, 0)<cr>
omap <silent> f :call FindChar(0, 1, 0)<cr>
nmap <silent> F :call FindChar(1, 0, 0)<cr>
omap <silent> F :call FindChar(1, 1, 0)<cr>
nmap <silent> t :call FindChar(0, 0, 1)<cr>
omap <silent> t :call FindChar(0, 0, 0)<cr>
nmap <silent> T :call FindChar(1, 0, 1)<cr>
omap <silent> T :call FindChar(1, 0, 0)<cr>

"Function to make f,F,t,T work across multiple lines
fun! FindChar(back, inclusive, exclusive)
  let flag = 'W' 
  if a:back
    let flag = 'Wb'
  endif
  if search('\V' . nr2char(getchar()), flag)
    if a:inclusive
      norm! l
    endif
    if a:exclusive
      norm! h
    endif
  endif
endfun

" Gundo map to open the tree
nnoremap <F4> :GundoToggle<CR>
