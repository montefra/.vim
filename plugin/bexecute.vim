" Tentative command to execute in the shell the file in use
" Now does not work
"
" Copyright (c) 2015 Francesco Montesano
" The MIT License (MIT)

function! FExecute(exe, ...)
  echom join(a:000)
  let l:festr = a:exe . " " . join(a:000, " ")
  echom l:festr
endfunction

function! BExecuteBuff(...)
  let l:nbuff = bufname("%")
  echom l:nbuff
  call FExecute(l:nbuff, a:000)
endfunction

command! -nargs=* Bexec call BExecuteBuff(<args>)

" if <F12> is not already in use, map it
" noremap <F12> :Bexec<cr>
