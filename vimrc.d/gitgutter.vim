let g:gitgutter_enabled = 1
let g:gitgutter_sign_column_always = 1
"let g:gitgutter_highlight_lines = 1 

let g:gitgutter_max_signs = 500  " default value

let g:gitgutter_override_sign_column_highlight = 0
highlight SignColumn ctermbg=233
highlight SignColumn guibg=121212

nnoremap <leader>/ :GitGutterToggle<CR>
