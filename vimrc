set nocompatible
set laststatus=2

set t_Co=256
colorscheme nick-railscasts

"source ~/.vim-config/powerline

" Vim Powerline ###################################################
set encoding=utf-8
"let g:Powerline_theme       = 'default'
let g:Powerline_colorscheme = 'default'
let g:Powerline_symbols     = 'fancy'
" Vim Powerline ###################################################

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Vundler ##########################################################
" let Vundle manage Vundle (required)
Bundle 'gmarik/vundle'

Bundle 'tpope/vim-abolish.git'
Bundle 'ack.vim' 
Bundle 'vim-scripts/buffergrep.git'
Bundle 'vim-scripts/compview.git' 
Bundle 'ctrlp.vim'
Bundle 'rizzatti/dash.vim'
  Bundle 'rizzatti/funcoo.vim'
Bundle 'elixir-lang/vim-elixir.git'
Bundle 'carlosgaldino/elixir-snippets.git'
Bundle 'vim-scripts/grep.vim.git'
Bundle 'mattn/gist-vim.git'
Bundle 'airblade/vim-gitgutter'
Bundle 'scrooloose/nerdcommenter.git'
Bundle 'scrooloose/nerdtree.git'
Bundle 'jeetsukumaran/vim-buffergator.git'
Bundle 'kchmck/vim-coffee-script.git'
Bundle 'Lokaltog/vim-easymotion.git'
Bundle 'tpope/vim-endwise.git'
Bundle 'tpope/vim-fugitive.git'
Bundle 'tpope/vim-haml.git'
Bundle 'pangloss/vim-javascript.git'
Bundle 'othree/javascript-libraries-syntax.vim.git'
Bundle 'lucapette/vim-jquery-doc.git'
Bundle 'vim-scripts/vim-jsbeautify.git'
Bundle 'plasticboy/vim-markdown.git'
Bundle 'tsaleh/vim-matchit.git'
Bundle 'juvenn/mustache.vim.git'
Bundle 'Lokaltog/vim-powerline.git'
Bundle 'ervandew/supertab.git'
Bundle 'godlygeek/tabular.git'
Bundle 'tpope/vim-rails.git'
Bundle 'vim-ruby/vim-ruby.git'
Bundle 'lucapette/vim-ruby-doc.git'
Bundle 'vim-scripts/SearchComplete.git'
Bundle 'vimez/vim-showmarks.git'
Bundle "garbas/vim-snipmate"
  Bundle "MarcWeber/vim-addon-mw-utils"
  Bundle "tomtom/tlib_vim"
Bundle 'gudleik/vim-slim.git'
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
Bundle 'honza/vim-snippets.git'
Bundle 'tpope/vim-surround.git'
Bundle 'scrooloose/syntastic.git'
Bundle 'majutsushi/tagbar.git'
"Bundle 'christoomey/vim-tmux-navigator'
Bundle 'ZoomWin'
" Vundler ##########################################################

" no swp files
set nobackup
set noswapfile

:set guioptions-=T
:set nowrap

" Do not auto-comment next line when current line is commented
:set formatoptions-=cro

"set clipboard+=unnamed " share system clipboard

set cursorline " highlight the current line
"set cursorcolumn " highlight the current column
set number " turn on line numbers
set backspace=2
set expandtab
set tabstop=2
set shiftwidth=2
set showcmd
set autoindent
set smartindent

filetype on
filetype plugin on
filetype indent on
syntax on

set hlsearch " Highlight search results

iabbrev teh the
iabbrev Teh The
iabbrev TEH THE

" Mappings #########################################################
"let mapleader = ","
nnoremap ; :
inoremap jj <esc>
map 0 ^
map { ^
"map ; $
map } $
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
map <Space> i
nnoremap <Leader>3 :set number!<CR>
nnoremap <Leader>c :set cursorline!<CR>
"nnoremap <Leader>c :set cursorline! cursorcolumn!
nnoremap <leader>[ :BuffergatorToggle<CR>
nnoremap <leader>n :NERDTreeToggle<CR>
nnoremap <leader>] :NERDTreeToggle<CR>
nnoremap <leader>/ :GitGutterToggle<CR>
"map <C-n> :NERDTreeToggle<CR>
"nmap <F8> :TagbarToggle<CR>
nnoremap <leader>' :TagbarToggle<CR>
" Mappings #########################################################

" Completion #######################################################
set wildmode=list:longest
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif
" Completion #######################################################

" CtrlP  ###########################################################
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
"let g:ctrlp_custom_ignore = {
  "\ 'dir':  '\v[\/]\.(git|hg|svn)$',
  "\ 'file': '\v\.(exe|so|dll)$',
  "\ 'link': 'some_bad_symbolic_links',
  "\ }
" CtrlP  ###########################################################

" git-gutter #######################################################
let g:gitgutter_enabled = 0
" git-gutter #######################################################
"
" javascript-libraries-syntax ######################################
let g:used_javascript_libs = 'angularjs,backbone,jquery,underscore'
" javascript-libraries-syntax ######################################

"NERDTree ##########################################################
let NERDTreeWinPos  = 'right'
let NERDTreeWinSize = 50
let NERDTreeIgnore  =   ['\.pyc$','\.swp$', '\.log$']
"autocmd VimEnter * NERDTreeClose
"autocmd VimEnter * wincmd p
" NERDTree #########################################################

"Buffer Gator #####################################################
let g:buffergator_split_size=51
let g:buffergator_sort_regime='basename'
"Buffer Gator #####################################################

" Snipmate ########################################################
let g:snipMate = {}
let g:snipMate.scope_aliases = {}
let g:snipMate.scope_aliases['ruby'] = 'ruby,ruby-rails,ruby-1.9'
" Snipmate ########################################################

" Showmarks #######################################################
let g:showmarks_enable=0
" Showmarks #######################################################

" Tabular #########################################################
if exists(":Tabularize")
  nmap <Leader>a= :Tabularize /=<CR>
  vmap <Leader>a= :Tabularize /=<CR>
endif
" Tabular #########################################################

" vim-jquery-doc #################################################
let g:jquery_doc_command='open'
let g:jquery_doc_mapping='RJ'
" vim-jquery-doc #################################################

" vim-ruby-doc ###################################################
let g:ruby_doc_command='open'
let g:ruby_doc_ruby_mapping='RB'
let g:ruby_doc_ruby_host='http://apidock.com/ruby/'
let g:ruby_doc_rails_mapping='RR'
let g:ruby_doc_rails_host='http://apidock.com/rails/'
let g:ruby_doc_rspec_mapping='RS'
" vim-ruby-doc ###################################################

" Strip trailing whitespace #######################################
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
" Strip trailing whitespace #######################################

" Vim-doc {
" let g:ruby_doc_command='open'
" let g:ruby_doc_ruby_mapping='RB'
" let g:ruby_doc_rails_mapping='RR'
" let g:ruby_doc_rspec_mapping='RS'
" let g:jquery_doc_command='open'
" let g:jquery_doc_mapping='JJ'
" }

function! DoPrettyXML()
    " save the filetype so we can restore it later
    let l:origft = &ft
    set ft=
    " delete the xml header if it exists. This will
    " permit us to surround the document with fake tags
    " without creating invalid xml.
    1s/<?xml .*?>//e
    " insert fake tags around the entire document.
    " This will permit us to pretty-format excerpts of
    " XML that may contain multiple top-level elements.
    0put ='<PrettyXML>'
      $put ='</PrettyXML>'
      silent %!xmllint --format -
    " xmllint will insert an <?xml?> header. it's easy enough to delete
    " if you don't want it.
    " delete the fake tags
    2d
    $d
    " restore the 'normal' indentation, which is one extra level
    " too deep due to the extra tags we wrapped around the document.
    silent %<
    " back to home
    1
    " restore the filetype
    exe "set ft=" . l:origft
endfunction
command! PrettyXml call DoPrettyXML()
