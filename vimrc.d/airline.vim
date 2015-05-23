set laststatus=2
set encoding=utf-8

if os == "Linux"
  let g:airline_right_sep = '◀'
  let g:airline_left_sep = '▶'
else
  let g:airline_powerline_fonts = 1
  "let g:airline_right_alt_sep = ''
  "let g:airline_right_sep = ''
  "let g:airline_left_alt_sep= ''
  "let g:airline_left_sep = ''
endif

"let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#fnamemod = ':t'
