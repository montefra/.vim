" The idea here is to grep all the TODOs and display them in a quickfix window.
" I'll eventually implement it
"
" Copyright (c) 2015 Francesco Montesano
" The MIT License (MIT)


" noremap <Leader>t :noautocmd vimgrep /TODO/j **/*.py<CR>:cw<CR>

"{{{ function listing the TODO into a preview window
" The function can take multiple arguments:
" a:1 
" function! todos(...) 

 "  vimgrep /TODO/j **/*.py
  " :cw

" endfunction
"}}}
