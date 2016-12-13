" override some of the rst syntax

let s:ReferenceName = '[[:alnum:]]\+\%([_.-][[:alnum:]]\+\)*'

execute 'syn region rstExDirective contained matchgroup=rstDirective' .
      \ ' start=+' . s:ReferenceName . '::\_s+' .
      \ ' skip=+^$+' .
      \ ' end=+^\s\@!+ contains=rstLiteralBlock'
