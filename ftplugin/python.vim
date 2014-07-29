" Python specific options

setlocal shiftwidth=4
set textwidth=79

"    <F7>        *@:call Flake8()<CR>
" maps <F7> also in insert mode
imap <buffer> <F7> <ESC> <F7>
