set cursorline " highlight the current line
"set cursorcolumn " highlight the current column
set number " turn on line numbers
set showcmd
set showmatch " highlight matching [{()}]
set hlsearch " Highlight search results

set backspace=2

set lazyredraw " redraw only when we need to.

:set guioptions-=T

:set formatoptions-=cro " Do not auto-comment next line when current line is commented

" _ : Quick horizontal splits
nnoremap _ :sp<cr>

" | : Quick vertical splits
nnoremap <bar> :vsp<cr>

" Ctrl-x: Cycle through the splits. I don't ever use enough splits to justify
" wasting 4 very easy to hit keys for them.
nnoremap <c-x> <c-w>w

" Lower the delay of escaping out of other modes
"set timeout timeoutlen=1000 ttimeoutlen=1
set timeout timeoutlen=500 ttimeoutlen=1
