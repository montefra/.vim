" start pathogen {{{
let g:pathogen_disabled = ["vim-airline"]  " clang_complete, 
runtime bundle/pathogen/autoload/pathogen.vim
execute pathogen#infect()
" create help tags
Helptags
"}}}

" general configuration options{{{

" add the line number
set number   
 
filetype plugin indent on
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

" never use tabs and set default tab to 2 spaces
set expandtab
set tabstop=4
set shiftwidth=2
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

" Gundo map {{{
noremap <F4> :GundoToggle<CR>
"}}}

" NERDTree map {{{
noremap <F3> :NERDTreeToggle<CR>
noremap <leader>ntf :NERDTreeFocus<CR>
"}}}

" vim-airline setting {{{
let g:airline#extensions#tabline#enabled = 1
" }}}

" clang complete setting {{{
let g:clang_library_path='/usr/lib/llvm-3.5/lib'
let g:clang_use_library=1
let g:clang_complete_copen=1
let g:clang_hl_errors=1
" let g:clang_periodic_quickfix=1
nnoremap <F7> :call g:ClangUpdateQuickFix() <CR>
imap <F7> <ESC> <F7>
let g:clang_jumpto_declaration_key='<leader>d'
" let g:clang_jumpto_declaration_in_preview_key='<leader>d'
" }}}
