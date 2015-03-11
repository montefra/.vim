" Save the current rst document and run `make html`

let g:sphinxtarget = "html"

function! MakeSphinx()
  echom "make " . g:sphinxtarget
  execute "make " . g:sphinxtarget
  cwindow
endfunction


map <buffer> <f12> :w<cr>:call MakeSphinx()<cr>``
imap <buffer> <f12> <ESC><f12>i
