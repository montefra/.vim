" Python specific options
"
" Copyright (c) 2015 Francesco Montesano
" The MIT License (MIT)

setlocal shiftwidth=4
set textwidth=79

" now use syntastic, so the following is uncommented
"    <F7>        *@:call Flake8()<CR>
" maps <F7> also in insert mode
" imap <buffer> <F7> <ESC> <F7>

" Toggle between tabs and not tabs (my default){{{
function! ToggleTab()
  " enable toggling
  if exists("b:use_tabs")  "{{{
    let b:use_tabs = !b:use_tabs
  else
    let b:use_tabs = 1
  endif  "}}}
  " save the original status line
  if !exists("b:original_statusline") "{{{
    let b:original_statusline = &statusline
  endif "}}}
  
  if b:use_tabs "{{{
    setlocal noexpandtab
    echo "Now using tabs"
    setlocal statusline=Tabs\ enabled\ -\ 
    setlocal statusline+=%f\ %m
    setlocal statusline+=%=   " go to right
    setlocal statusline+=%l,%c%14P
  else
    setlocal expandtab
    echo "Tabs disabled as by default"
    if strlen(b:original_statusline) == 0
      setlocal statusline=
    else
      setlocal statusline=%!b:original_statusline
    endif
  endif  "}}}

endfunction
"}}}
