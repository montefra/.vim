" Plugin containing some maps to mover around. 

" 'cw' and 'cW' behave like 'ce' and 'cE'. This try to fix it{{{
" from vim help: If you prefer "cw" to include the space after a word, use this mapping: 
map cw dwi
map cW dWi
"}}}

"Makes f,F,T and t work across multiple lines{{{
nnoremap <silent> f :call FindChar(0, 0, 0)<cr>
onoremap <silent> f :call FindChar(0, 1, 0)<cr>
nnoremap <silent> F :call FindChar(1, 0, 0)<cr>
onoremap <silent> F :call FindChar(1, 1, 0)<cr>
nnoremap <silent> t :call FindChar(0, 0, 1)<cr>
onoremap <silent> t :call FindChar(0, 0, 0)<cr>
nnoremap <silent> T :call FindChar(1, 0, 1)<cr>
onoremap <silent> T :call FindChar(1, 0, 0)<cr>

fun! FindChar(back, inclusive, exclusive)  "{{{
  let flag = 'W' 
  if a:back
    let flag = 'Wb'
  endif
  if search('\V' . nr2char(getchar()), flag)
    if a:inclusive
      normal! l
    endif
    if a:exclusive
      normal! h
    endif
  endif
endfun
"}}}
"}}}
