" Set color schemes and other colors
"
" Copyright (c) 2015 Francesco Montesano
" The MIT License (MIT)


colorscheme harlequin

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

highlight Visual term=reverse cterm=reverse ctermbg=236 guibg=Grey

" step through colors {{{
nmap <leader>csp <Plug>ColorstepPrev
nmap <leader>csn <Plug>ColorstepNext
nmap <leader>csr <Plug>ColorstepReload
"}}}

" show where the cursor is {{{
" highlight CursorLineNr  term=bold ctermfg=DarkYellow gui=bold guifg=Yellow
" highlight LineNr  term=bold ctermfg=LightYellow gui=bold guifg=LightYellow
highlight CursorLine cterm=NONE
"}}}

" Spell colors, {{{
" highlight SpellLocal term=underline ctermbg=blue gui=undercurl guisp=Cyan
highlight SpellBad term=reverse ctermbg=DarkRed gui=undercurl guisp=Red
"}}}

" markdown and rst headers colors{{{
" highlight htmlH1 term=bold ctermfg=yellow gui=bold guifg=Magenta
" highlight rstSections term=bold ctermfg=red gui=bold guifg=red
"}}}

" return the highlight group syntax under the cursor:{{{
" http://vim.wikia.com/wiki/Showing_syntax_highlight_group_in_statusline
" used when tweaking with colors
function! SyntaxItem()
  highlight Ignore ctermfg=blue guifg=bg
  return synIDattr(synID(line("."),col("."),1),"name")
endfunction
"}}}

" Color test: Save this file, then enter ':so %'{{{
" from
" https://emerg3nc3.wordpress.com/2012/07/28/full-256-color-support-for-vim-andor-xterm-on-ubuntu-12-04/
" Then enter the following commands:
"   :VimColorTest    "(for console/terminal Vim)
function! VimColorTest(outfile, fgend, bgend)
  let result = []
  for fg in range(a:fgend)
    for bg in range(a:bgend)
      let kw = printf('%-7s', printf('c_%d_%d', fg, bg))
      let h = printf('hi %s ctermfg=%d ctermbg=%d', kw, fg, bg)
      let s = printf('syn keyword %s %s', kw, kw)
      call add(result, printf('%-32s | %s', h, s))
    endfor
  endfor
  call writefile(result, a:outfile)
  execute 'edit '.a:outfile
  source %
endfunction
" Increase numbers in next line to see more colors.
command! VimColorTest call VimColorTest('vim-color-test.tmp', 1, 256)
"}}}

" non used{{{
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
" }}}
