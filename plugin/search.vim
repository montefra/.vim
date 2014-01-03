" plug-in containing searching related options

set incsearch       " highlight next match when searching

" When there is a previous search pattern, highlight all its matches.
set hlsearch 
" When you get bored looking at the highlighted matches, you can turn it
" off with |:nohlsearch|.
noremap <leader>nh :nohlsearch<cr>

set ignorecase smartcase    " ignore case when searching, but in a smart way
