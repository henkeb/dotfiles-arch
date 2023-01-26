--vim.api.nvim_create_autocmd({ "BufWritePre" }, {
-- pattern = { "*" },
--command = [[%s/\s\+$//e]],
--})
--
vim.cmd([[autocmd BufWritePre * lua vim.lsp.buf.formatting_sync()]])
