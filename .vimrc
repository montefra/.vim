" start pathogen
runtime bundle/pathogen/autoload/pathogen.vim
execute pathogen#infect()
" create help tags
Helptags

set number   " add the numbero of the line
 
filetype plugin on

filetype indent on    " set indent according to the file type
set autoindent      " indent automatic
"set smartindent     " and smart

syntax on       " enable sintax color
let fortran_free_source=1

set expandtab      "substitute tabs with spaces
set shiftwidth=2


set vb t_vb=        " disable beep and flash
set ruler           " enable the ruler at the lower right corner

set showmatch       " when searcing enhance the matching
set incsearch       " enable search in the command line
set ignorecase smartcase    " ignore case when searching, but in a smart way

" The 'scrolloff' (scroll offset) option determines the number of context
" lines you would like to see above and below the cursor.
set scrolloff=5

"let distro = system("awk '/^NAME=/ {print $1}' /etc/os-release")
let distro = system(". /etc/os-release; echo -n $NAME")
if distro == "openSUSE"
  "color comments in different color
  highlight Comment ctermfg=lightblue
else
  colorscheme zellner
endif

"needed from vim-latex
set grepprg=grep\ -nH\ --color\ $*
let g:tex_flavor='latex'
" smart indentation in latex
let g:tex_indent_items = 1
let g:tex_indent_brace = 0

" Only do this part when compiled with support for autocommands
if has("autocmd")
  " When editing a file, always jump to the last cursor position
  autocmd BufReadPost *
  \ if line("'\"") > 0 && line ("'\"") <= line("$") |
  \   exe "normal g'\"" |
  \ endif
endif

"save file with old undos so that it is possible to go back in the history
set undofile

"maxfuncdepth for user functions
set maxfuncdepth=300

if has("autocmd")
  au BufRead,BufNewFile *.tex set tw=80 "maximum textwidth=80 for tex file
  au BufRead,BufNewFile *.py set shiftwidth=4  "four spaces indent for python files
  au BufRead,BufNewFile *.ipy set shiftwidth=4  "four spaces indent for ipython files
  
  " markdown filetype file
  au BufRead,BufNewFile *.{md,mdown,mkd,mkdn,markdown,mdwn}   set filetype=markdown
endif

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

"status line hightlight. green: current window, red: others windows
hi StatusLine ctermbg=green ctermfg=white
hi StatusLineNC ctermbg=white ctermfg=red

" Gundo map to open the tree
nnoremap <F4> :GundoToggle<CR>
