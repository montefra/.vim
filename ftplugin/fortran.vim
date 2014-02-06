" some specific folding for fortran taken from
" https://bbs.archlinux.org/viewtopic.php?id=68362

let fortran_fold=1
"Additionally you can force folding on conditionals and multiline comments trhough
let fortran_fold_conditionals=1
let fortran_fold_multilinecomments=1

setlocal foldmethod=syntax

"let's see if this fix some of the crap coloring found somewhere
"let fortran_more_precise=1

let b:fortran_do_enddo=1
