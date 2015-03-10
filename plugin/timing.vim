" function to time the execution time of other functions
"
" Copyright (c) 2015 Francesco Montesano
" The MIT License (MIT)

" Times the number of times a particular command takes to execute the specified number of times (in seconds).
" from vim.wikia.com/wiki/Measure_time_taken_to_execute_a_command
function! HowLong( command, numberOfTimes )
  " We don't want to be prompted by a message if the command being tried is
  " an echo as that would slow things down while waiting for user input.
  let more = &more
  set nomore
  let startTime = localtime()
  for i in range( a:numberOfTimes )
    execute a:command
  endfor
  let result = localtime() - startTime
  let &more = more
  return result
endfunction
