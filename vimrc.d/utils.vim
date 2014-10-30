" <Leader>f: Copy the full path of the current file to the clipboard
nnoremap <silent> <Leader>f :let @+=expand("%:p")<cr>:echo "Copied current file
      \ path '".expand("%:p")."' to clipboard"<cr>

" w!!: Writes using sudo
cnoremap w!! w !sudo tee % >/dev/null

" <Leader>e: Fast editing of the .vimrc
nnoremap <Leader>e :e! ~/.vimrc<cr>
