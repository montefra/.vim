" avoid big troubles when hitting <F1> by error
" from http://vim.wikia.com/wiki/Disable_F1_built-in_help_key
" SophHelp opens help if closed and close it if the cursor is in the help
" file. If the cursor is on a word in a *non help* file, the help for that
" word is searched
"
" Copyright (c) 2015 Francesco Montesano
" The MIT License (MIT)

function! SophHelp() " {{{1
  if &buftype=="help"  " {{{2
    "&& match( strpart( getline("."), col(".")-1,1), "\\S")<0
    bw
  elseif &buftype=="tex" " {{{2
    exec 'normal \<Plug>Tex_Help'
  else " other buffers {{{2
    try " cWORD {{{3
      exec "help ".expand("<cWORD>")
    catch /:E149:\|:E661:/ 
      " E149 no help for <subject>
      " E661 no <language> help for <subject>
      try " cword {{{4
        exec "help ".expand("<cword>")
      catch /:E149:\|:E661:/ 
        " E149 no help for <subject>
        " E661 no <language> help for <subject>
        exec "help"
      endtry "}}}4
    endtry "}}}3
  endif "}}}2
endfunc "}}}1

nnoremap <silent> <F1> :call SophHelp()<CR>
inoremap <silent> <F1> <Esc><F1>


