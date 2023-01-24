vim.cmd([[
let g:openbrowser_search_engines = extend(
\ get(g:, 'openbrowser_search_engines', {}),
\ {
\   'cppreference': 'https://en.cppreference.com/mwiki/index.php?title=Special%3ASearch&search={query}',
\   'stackoverflow': 'https://stackoverflow.com/search?q={query}',
\   'rustdocs': 'https://doc.rust-lang.org/std/?search={query}'
\ },
\ 'keep'
\)

nnoremap <silent> <leader>osx :call openbrowser#smart_search(expand('<cword>'), "cppreference")<CR>
nnoremap <silent> <leader>oss :call openbrowser#smart_search(expand('<cword>'), "stackoverflow")<CR>
nnoremap <silent> <leader>osr :call openbrowser#smart_search(expand('<cword>'), "rustdocs")<CR>
]])

vim.keymap.set("n", "gx", "<Plug>(openbrowser-smart-search)")
