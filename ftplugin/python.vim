" Python specific options
"
" Copyright (c) 2015 Francesco Montesano
" The MIT License (MIT)

setlocal shiftwidth=4
set textwidth=79

" switch between python 2 and python 3 {{{
function! SyntasticPySwitch()
  if exists("g:syntastic_python_python_exe")
    unlet g:syntastic_python_python_exe
  else
    let g:syntastic_python_python_exe = '/usr/bin/python3'
  endif
endfunction
"}}}

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
