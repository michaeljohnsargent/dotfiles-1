"### NeoBundle ######################################################
if has('vim_starting')
  set nocompatible " Be iMproved
  set runtimepath+=$HOME/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('$HOME/.vim/bundle'))

NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'tpope/vim-abolish.git'
"NeoBundle 'ack.vim'
NeoBundle 'mileszs/ack.vim'
NeoBundle 'bling/vim-airline'
"NeoBundle 'jeetsukumaran/vim-buffergator.git'
NeoBundle 'ton/vim-bufsurf.git'
"NeoBundle 'kien/ctrlp.vim'
NeoBundle 'kchmck/vim-coffee-script.git'
NeoBundle 'rizzatti/dash.vim'
NeoBundle 'junegunn/vim-easy-align'
NeoBundle 'Lokaltog/vim-easymotion.git'
NeoBundle 'elixir-lang/vim-elixir.git'
"NeoBundle 'carlosgaldino/elixir-snippets.git'
NeoBundle 'tpope/vim-endwise.git'
NeoBundle 'tpope/vim-fugitive.git'
NeoBundle 'mattn/gist-vim'
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'fatih/vim-go'
NeoBundle 'tpope/vim-haml.git'
NeoBundle 'elzr/vim-json'
NeoBundle 'othree/javascript-libraries-syntax.vim.git'
"NeoBundle 'vim-scripts/vim-jsbeautify.git'
NeoBundle 'plasticboy/vim-markdown.git'
"NeoBundle 'tsaleh/vim-matchit.git'
NeoBundle 'terryma/vim-multiple-cursors'
NeoBundle 'juvenn/mustache.vim.git'
"NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neomru.vim.git'
"NeoBundle 'Shougo/neosnippet'
"NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'scrooloose/nerdcommenter.git'
NeoBundle 'scrooloose/nerdtree.git'
"NeoBundle 'Lokaltog/vim-powerline.git'
NeoBundle 'tpope/vim-rails.git'
NeoBundle 'tpope/vim-repeat.git'
NeoBundle 'vim-ruby/vim-ruby.git'
"NeoBundle 'vim-ruby/vim-rubyhash.git'
NeoBundle 'kana/vim-scratch.git'
NeoBundle 'vim-scripts/SearchComplete.git'
NeoBundle 'honza/vim-snippets'
NeoBundle 'rstacruz/sparkup.git'
NeoBundle 'ervandew/supertab.git'
NeoBundle 'tpope/vim-surround.git'
NeoBundle 'scrooloose/syntastic.git'
NeoBundle 'godlygeek/tabular.git'
NeoBundle 'majutsushi/tagbar.git'
NeoBundle 'christoomey/vim-tmux-navigator'
"NeoBundle 'edkolev/tmuxline.vim'
NeoBundle 'SirVer/ultisnips'
NeoBundle 'Shougo/unite.vim.git'
NeoBundle 'Shougo/unite-session.git'
NeoBundle 'gudleik/vim-slim.git'
"NeoBundle 'vim-scripts/YankRing.vim,git'
NeoBundle 'Shougo/vimproc.vim', { 'build' : { 'mac' : 'make -f make_mac.mak', 'linux' : 'make' } }
"NeoBundle 'sjl/vitality.vim'
NeoBundle 'vim-scripts/ZoomWin.git'

" You can specify revision/branch/tag.
"NeoBundle 'Shougo/vimshell', { 'rev' : '3787e5' }

call neobundle#end()

filetype plugin indent on

NeoBundleCheck

" Load local plugins, nice for doing development
"execute 'NeoBundleLocal' '~/code/vim'
"### NeoBundle ######################################################

let os = substitute(system('uname'), "\n", "", "")

" Source all .vim files in ~/.vimrc.d
for fpath in split(globpath('~/.vimrc.d/', '*.vim'), '\n')
  exe 'source' fpath
endfor
