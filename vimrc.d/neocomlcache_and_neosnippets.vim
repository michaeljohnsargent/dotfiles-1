"" Launches neocomplcache automatically on vim startup.
"let g:neocomplcache_enable_at_startup = 1
"" Use smartcase.
"let g:neocomplcache_enable_smart_case = 1
"" Use camel case completion.
"let g:neocomplcache_enable_camel_case_completion = 1
"" Use underscore completion.
"let g:neocomplcache_enable_underbar_completion = 1
"" Sets minimum char length of syntax keyword.
"let g:neocomplcache_min_syntax_length = 3
"let g:neocomplcache_min_keyword_length = 3
"" AutoComplPop like behavior.
"let g:neocomplcache_enable_auto_select = 1
"" let g:snips_author = "Jason Harrelson"
"" let g:neocomplcache_max_list=10
"" <Tab>'s function is overloaded depending on the context:
"" - If the current word is a snippet, then expand that snippet
"" - If we're in the middle of a snippet, tab jumps to the next placeholder text
"" - If the competion menu is visible, enter the currently selected entry and
""   close the popup
"" - If none of the above is true, simply do what <Tab> does originally
"imap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? neocomplcache#close_popup() : "\<TAB>"
"smap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
"imap <C-a> <Plug>(neosnippet_expand_or_jump)
"smap <C-a> <Plug>(neosnippet_expand_or_jump)
"xmap <C-a> <Plug>(neosnippet_expand_target)

"" SuperTab like snippets behavior.
"imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
"\ "\<Plug>(neosnippet_expand_or_jump)"
"\: pumvisible() ? "\<C-n>" : "\<TAB>"
"smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
"\ "\<Plug>(neosnippet_expand_or_jump)"
"\: "\<TAB>"

"" Enter always performs a literal enter
""imap <expr><cr> neocomplcache#smart_close_popup() . "\<CR>"

"if has('conceal')
 "set conceallevel=2 concealcursor=i
"endif

"" Tell Neosnippets to use the snipmate snippets
"let g:neosnippet#snippets_directory='~/.dotfiles/.vim/bundle/snipmate-snippets,~/.dotfiles/.vim/snippets'
