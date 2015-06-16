" Nerd tree specific settings
"
" Copyright (c) 2015 Francesco Montesano
" The MIT License (MIT)

noremap <F3> :NERDTreeMirrorToggle<CR>
noremap <S-F3> :NERDTreeFocusToggle<CR>
noremap <leader>ff :NERDTreeFind<CR>

let NERDTreeIgnore = ['\.pyc$[[file]]', '__pycache__[[dir]]', '.o$[[file]]']
