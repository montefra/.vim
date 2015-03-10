" Set color schemes and other colors
"
" Copyright (c) 2015 Francesco Montesano
" The MIT License (MIT)

" Select color-scheme based on distro {{{
" if g:distro ==? "openSUSE"
  " color comments in different color
  " highlight Comment ctermfg=lightblue
" else
  " colorscheme zellner
  "highlight Directory ctermfg=lightblue
  " highlight Comment ctermfg=darkgreen
" endif
"}}}

"status line hightlight. blue: current window, red: others windows {{{
" highlight StatusLine ctermbg=white ctermfg=blue
" highlight StatusLineNC ctermbg=white ctermfg=red
"}}}

" Latex-vim{{{
" <F9> provide autocompletion on `ref` and `cite`. 
" In the __OUTLINE__ split where is possible to chose the reference or
" citation keyword, the cursor disappears or looks white when in the first
" character(s) of the lines
" These hightlights make the first part of the lines look as the rest
" highlight link firstAngle labelLine 
" highlight link firstSemiColon previousLine
" highlight link BibTitleHeader BibTitle
" highlight link BibAuthorHeader BibAuthor
" highlight link BibLocationHeader BibLocation
"}}}
 
" fold {{{
" highlight Folded term=standout,bold cterm=bold ctermfg=Black ctermbg=DarkCyan guifg=Cyan guibg=DarkGrey
" }}}

" SpellLocal on is white on light blue background, {{{
" making it not very easy to read
" highlight SpellLocal term=underline ctermbg=blue gui=undercurl guisp=Cyan
"}}}

" return the highlight group syntax under the cursor:{{{
" http://vim.wikia.com/wiki/Showing_syntax_highlight_group_in_statusline
" used when tweaking with colors
function! SyntaxItem()
  highlight Ignore ctermfg=blue guifg=bg
  return synIDattr(synID(line("."),col("."),1),"name")
endfunction
"}}}
