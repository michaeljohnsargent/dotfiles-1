call unite#filters#matcher_default#use(['matcher_fuzzy'])

let g:unite_data_directory = "~/.unite"
"let g:unite_split_rule = "botright"

let g:unite_source_file_mru_limit = 25
"let g:unite_cursor_line_highlight = 'TabLineSel'

let g:unite_source_file_mru_filename_format = ':~:.'
let g:unite_source_file_mru_time_format = ''

"let g:unite_abbr_highlight = 'TabLine'

" Map space to the prefix for Unite
nnoremap [unite] <Nop>
nmap <space> [unite]

" General fuzzy search
nnoremap <silent> [unite]<space> :<C-u>Unite
      \ -buffer-name=files buffer file_mru bookmark file_rec/async<CR>

" Quick registers
nnoremap <silent> [unite]r :<C-u>Unite -buffer-name=register register<CR>

" Quick buffer and mru
nnoremap <silent> [unite]u :<C-u>Unite -buffer-name=mru/buffers file_mru buffer<CR>

" Quick outline
"nnoremap <silent> [unite]o :<C-u>Unite -buffer-name=outline -vertical outline<CR>

" Quick file search
nnoremap <silent> [unite]f :<C-u>Unite -buffer-name=files -start-insert file_rec/async file/new<CR>

" Quick grep from cwd
nnoremap <silent> [unite]g :<C-u>Unite -buffer-name=grep grep:.<CR>

" Quick line using the word under cursor
nnoremap <silent> [unite]w :<C-u>UniteWithCursorWord -buffer-name=search_file line<CR>

" Quick line
nnoremap <silent> [unite]l :<C-u>Unite -buffer-name=search_file line<CR>

" Quick MRU search
nnoremap <silent> [unite]m :<C-u>Unite -buffer-name=mru file_mru<CR>

" Quick find
nnoremap <silent> [unite]n :<C-u>Unite -buffer-name=find find:.<CR>

" Quick commands
nnoremap <silent> [unite]c :<C-u>Unite -buffer-name=commands command<CR>

" Quick bookmarks
nnoremap <silent> [unite]b :<C-u>Unite -buffer-name=bookmarks bookmark<CR>

" Quick sources
nnoremap <silent> [unite]a :<C-u>Unite -buffer-name=sources source<CR>

" Quick sessions (projects)
nnoremap <silent> [unite]s :<C-u>Unite -buffer-name=sessions session<CR>

nnoremap <space>/  :Unite grep:.<cr>
nnoremap <leader>[ :Unite -quick-match buffer<cr>
"nnoremap <space>b  :Unite -quick-match buffer<cr>
nnoremap <C-p>     :Unite -no-split -start-insert file_rec/async:!<cr>
"nnoremap <space>f  :Unite -no-split -start-insert file_rec/async:!<cr>
"nnoremap <C-a> :Unite -no-split -start-insert -auto-preview file_rec/async:!<cr>
"nnoremap <leader>t :<C-u>Unite -no-split -buffer-name=files   -start-insert file_rec/async:!<cr>
"nnoremap <leader>f :<C-u>Unite -no-split -buffer-name=files   -start-insert file<cr>
"nnoremap <leader>r :<C-u>Unite -no-split -buffer-name=mru     -start-insert file_mru<cr>
"nnoremap <leader>o :<C-u>Unite -no-split -buffer-name=outline -start-insert outline<cr>

let g:unite_source_history_yank_enable = 1
" Quick yank history
nnoremap <silent> [unite]y :<C-u>Unite -buffer-name=yanks history/yank<CR>
nnoremap <leader>y :<C-u>Unite -no-split -buffer-name=yanks history/yank<cr>
"nnoremap <leader>e :<C-u>Unite -no-split -buffer-name=buffer  buffer<cr>

" Ctrl-y: Yanks
"nmap <c-y> [unite]y

" Ctrl-\: Quick outline
"nmap <silent> <c-\> [unite]o

" Ctrl-sa: Reopen last grep window
"nnoremap <c-s><c-a> :UniteResume -buffer-name=grep<CR>
" Ctrl-ss: (S)earch word under cur(s)or in current directory
"nnoremap <c-s><c-s> :Unite -buffer-name=grep grep:.::<C-r><C-w><CR>
" Ctrl-sd: (S)earch word in current (d)irectory (prompt for word)
"nnoremap <c-s><c-d> :Unite -buffer-name=grep grep:.<CR>
" Ctrl-sf: Quickly (s)earch in (f)ile
"nmap <c-s><c-f> [unite]l
" Ctrl-sr: Easier (s)earch and (r)eplace
"nnoremap <c-s><c-r> :%s/<c-r><c-w>//gc<left><left><left>
" Ctrl-sw: Quickly surround word
"nmap <c-s><c-w> ysiw

" Ctrl-c: (C)hange (c)urrent directory
"nmap <c-c> [unite]d

" Custom mappings for the unite buffer
"autocmd FileType unite call s:unite_settings()
"function! s:unite_settings()
  "" Play nice with supertab
  "let b:SuperTabDisabled=1
  "" Enable navigation with control-j and control-k in insert mode
  "imap <buffer> <C-j>   <Plug>(unite_select_next_line)
  "imap <buffer> <C-k>   <Plug>(unite_select_previous_line)
"endfunction
