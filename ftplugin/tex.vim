"
" Copyright (c) 2015 Francesco Montesano
" The MIT License (MIT)

" vim-latex suite settings{{{
"set targets {{{
let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_MultipleCompileFormats = 'pdf'
let g:Tex_FormatDependency_pdf = 'pdf'
"}}}


"set compilation rules {{{
let g:Tex_CompileRule_dvi = 'latex -scr-special -synctex=1 $*'
let g:Tex_CompileRule_ps = 'dvips -Ppdf -o $*.ps $*.dvi'
let g:Tex_CompileRule_pdf = 'pdflatex -interaction=nonstopmode $*'
"let g:Tex_CompileRule_pdf = 'pdflatex -interaction=nonstopmode $*'

"let g:Tex_ViewRule_pdf = '/usr/bin/acroread'
"let g:Tex_ViewRule_dvi = '/usr/bin/okular --unique'
let g:Tex_ViewRule_dvi = '/usr/bin/evince'
let g:Tex_ViewRule_ps = '/usr/bin/evince'
let g:Tex_ViewRule_pdf = '/usr/bin/evince'
"}}}

"save and compile{{{
map <buffer> <f12> :w<cr><leader>ll``
imap <buffer> <f12> <ESC>:w<cr><leader>ll``i
"}}}

" TIP: if you write your \label's as \label{fig:something}, then if you{{{
" type in \ref{fig: and press <C-n> you will automatically cycle through
" all the figure labels. Very useful!
set iskeyword+=:
"}}}

" redefine figure command.{{{
let g:Tex_Env_figure =    "\\begin{figure}\<cr>\\centering\<cr>\\includegraphics[width=80mm, keepaspectratio]{<+file+>}\<cr>\\caption{<+caption text+>}\<cr>\\label{fig:<+label+>}\<cr>\\end{figure}<++>"
let g:Tex_Env_figures =  "\\begin{figure*}\<cr>\\centering\<cr>\\includegraphics[width=160mm, keepaspectratio]{<+file+>}\<cr>\\caption{<+caption text+>}\<cr>\\label{fig:<+label+>}\<cr>\\end{figure*}<++>"

call IMAP ('EFS', g:Tex_Env_figures, 'tex')
"}}}

" beamer frame environment{{
" inspired by http://utkarshu.in/Adding_frame_environment.html
call IMAP('EFE', "\\begin{frame}\<CR>\\frametitle{<++>}\<CR><++>\<CR>\\end{frame}<++>", 'tex')
" }}

" maps for equation, table, figure, appendix and section reference{{{
call IMAP ('TAB', "Table \\ref{<++>}<++>", 'tex')
call IMAP ('SECT', "Section \\ref{<++>}<++>", 'tex')
call IMAP ('CHAP', "Chapter \\ref{<++>}<++>", 'tex')
call IMAP ('FIG', "Figure \\ref{<++>}<++>", 'tex')
call IMAP ('EQU', "equation (\\ref{<++>})<++>", 'tex')
call IMAP ('APP', "Appendix \\ref{<++>}<++>", 'tex')
"}}}
"}}}

" don't highlight search in tex files, it gets annoying because of some
" command in vim-latex suite
set nohlsearch 

" spelling
setlocal spell spelllang=en_gb

" Operator pending map to be able the yank inside a $
call CountJump#TextObject#MakeWithCountSearch('<buffer>', '$', 'ai', 'v', '\$', '\$')

" Width of text{{{
" By default the text is 
let s:textwidth = 80
let &l:textwidth=s:textwidth

" Toggle between textwidth and wrap and textwidth=0 and nowrap. {{{
" When editing a table, can be useful to have all the '&' aligned (using e.g.
" ':Tabularize /&') but without line brakes and wraps. Besides it's very
" annoying when line brakes "happens" while editing.
" As hopefully tables must be edited only from time to time, one can toggle
" wrap and textwidth by hand. 
function! ToggleWrap() "{{{
  " if textwidth and wrap is used, then disable them
  if &textwidth > 0
    let &l:textwidth=0
    setlocal nowrap
  else " otherwise re-enable them
    let &l:textwidth=s:textwidth
    setlocal wrap
  endif
endfunction
"}}}

"}}}

"}}}
