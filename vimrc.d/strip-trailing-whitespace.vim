fun! <SID>StripTrailingWhitespaces()
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e
  call cursor(l, c)
endfun

autocmd BufWritePre *.rb :call <SID>StripTrailingWhitespaces()
autocmd BufWritePre *.yml :call <SID>StripTrailingWhitespaces()
autocmd BufWritePre *.erb :call <SID>StripTrailingWhitespaces()
autocmd BufWritePre *.haml :call <SID>StripTrailingWhitespaces()
autocmd BufWritePre *.rabl :call <SID>StripTrailingWhitespaces()
autocmd BufWritePre *.js :call <SID>StripTrailingWhitespaces()
autocmd BufWritePre *.css :call <SID>StripTrailingWhitespaces()
autocmd BufWritePre *.rake :call <SID>StripTrailingWhitespaces()
autocmd BufWritePre Gemfile :call <SID>StripTrailingWhitespaces()
autocmd BufWritePre Guardfile :call <SID>StripTrailingWhitespaces()
autocmd BufWritePre Guardfile.example :call <SID>StripTrailingWhitespaces()
