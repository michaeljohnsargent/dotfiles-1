set laststatus=2
set encoding=utf-8

"let g:airline_theme='badwolf'
"let g:airline_theme='base16'
"let g:airline_theme='bubblegum'
let g:airline_theme='dark'
"let g:airline_theme='jellybeans'
"let g:airline_theme='laederon'
"let g:airline_theme='luna'
"let g:airline_theme='molokai'
"let g:airline_theme='murmur'
"let g:airline_theme='powerlineish'
"let g:airline_theme='simple'
"let g:airline_theme='tomorrow'
"let g:airline_theme='ubaryd'
"let g:airline_theme='wombat'

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
