"""""""""""""""""""""""""""""""""
" Set color schemes and other colors
"""""""""""""""""""""""""""""""""

"let distro = system("awk '/^NAME=/ {print $1}' /etc/os-release")
let distro = system(". /etc/os-release; echo -n $NAME")
if distro == "openSUSE"
  "color comments in different color
  highlight Comment ctermfg=lightblue
else
  colorscheme zellner
  highlight Directory ctermfg=lightblue
endif

"status line hightlight. green: current window, red: others windows

hi StatusLine ctermbg=white ctermfg=blue
hi StatusLineNC ctermbg=white ctermfg=red

" function which returns the highlight group syntax under the cursor:
" http://vim.wikia.com/wiki/Showing_syntax_highlight_group_in_statusline
" used when tweaking with colors
function! SyntaxItem()
  return synIDattr(synID(line("."),col("."),1),"name")
endfunction
