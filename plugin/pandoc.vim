" tentative plugin to wrap pandoc to convert markdown files into the desired
" format. It doesn't work
"
" Copyright (c) 2015 Francesco Montesano
" The MIT License (MIT)

function! CallPandoc(ifile, ofile, options)
  let s:option = join(a:options)
  let s:output = system('pandoc ' . s:option .' ' . a:ifile . ' -o ' . a:ofile)
endfunction

function! Pandoc_ToPDF(...)

  let s:ifile = expand('%:p') " get full file name
  let s:ext = expand('%:e')   " get the extention
  let s:ofile = substitute(s:ifile, s:ext, "pdf", "") " create the output pdf
  
  call CallPandoc(s:ifile, s:ofile, a:000)
endfunction

command -nargs=* P2pdf call Pandoc_ToPDF(<args>)
