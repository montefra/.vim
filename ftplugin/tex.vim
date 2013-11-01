"set targets
let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_MultipleCompileFormats = 'dvi,ps,pdf'
let g:Tex_FormatDependency_pdf = 'dvi,ps,pdf'

"set compilation rules
let g:Tex_CompileRule_dvi = 'latex -interaction=nonstopmode -scr-special -synctex=1 $*'
let g:Tex_CompileRule_ps = 'dvips -Ppdf -o $*.ps $*.dvi'
let g:Tex_CompileRule_pdf = 'ps2pdf $*.ps'
"let g:Tex_CompileRule_pdf = 'pdflatex -interaction=nonstopmode $*'

"let g:Tex_ViewRule_pdf = '/usr/bin/acroread'
let g:Tex_ViewRule_dvi = '/usr/bin/okular --unique'
let g:Tex_ViewRule_ps = '/usr/bin/okular --unique'
let g:Tex_ViewRule_pdf = '/usr/bin/okular --unique'

"local setting when using latex-vim
"save and compile
map <f12> :w<cr><leader>ll``
imap <f12> <ESC>:w<cr><leader>ll``i

" TIP: if you write your \label's as \label{fig:something}, then if you
" type in \ref{fig: and press <C-n> you will automatically cycle through
" all the figure labels. Very useful!
set iskeyword+=:

"spelling
setlocal spell spelllang=en_gb
"maximum width of a line
set tw=90

"map some commonly used command to for equation, table, figure, appendix and
"section reference
call IMAP ('TAB', "Table \\ref{<++>}<++>", 'tex')
call IMAP ('SECT', "Section \\ref{<++>}<++>", 'tex')
call IMAP ('CHAP', "Chapter \\ref{<++>}<++>", 'tex')
call IMAP ('FIG', "Figure \\ref{<++>}<++>", 'tex')
call IMAP ('EQU', "equation (\\ref{<++>})<++>", 'tex')
call IMAP ('APP', "Appendix \\ref{<++>}<++>", 'tex')

