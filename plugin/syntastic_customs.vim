" Syntastic customizations and utility functions

" In python from time to time Syntastic is set to skip checks. Make a command to
" reenable it easily

command SyntasticReenable let b:syntastic_skip_checks = 0
