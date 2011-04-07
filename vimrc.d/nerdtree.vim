let NERDTreeWinPos  = 'right'
let NERDTreeWinSize = 50
let NERDTreeIgnore  =   ['\.pyc$','\.swp$', '\.log$']

"autocmd VimEnter * NERDTreeClose
"autocmd VimEnter * wincmd p

map <leader>p :NERDTreeFind<cr>

nnoremap <leader>n :NERDTreeToggle<CR>
nnoremap <leader>] :NERDTreeToggle<CR>
