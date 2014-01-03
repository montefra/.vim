" avoid big troubles when hitting <F1> by error
" from http://vim.wikia.com/wiki/Disable_F1_built-in_help_key
" SophHelp opens help if closed and close it if the cursor is in the help
" file. If the cursor is on a word in a *non help* file, the help for that
" word is searched

function! SophHelp()
  if &buftype=="help" 
    "&& match( strpart( getline("."), col(".")-1,1), "\\S")<0
    bw
  else
    try
      exec "help ".expand("<cWORD>")
    catch /:E149:\|:E661:/
      " E149 no help for <subject>
      " E661 no <language> help for <subject>
      exec "help ".expand("<cword>")
    endtry
  endif
endfunc

nnoremap <silent> <F1> :call SophHelp()<CR>
inoremap <F1> <Esc><F1>


