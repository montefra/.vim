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
endif

"status line hightlight. green: current window, red: others windows

hi StatusLine ctermbg=white ctermfg=blue
hi StatusLineNC ctermbg=white ctermfg=red


