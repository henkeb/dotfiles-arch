require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = {
		-- Language servers
		"lua_ls",
		"bashls",
		"clangd",
		"cmake",
		"pyright",
		"rust_analyzer",
		"yamlls",
		"marksman",
		"tsserver",
		"html",
		-- Formatters
		-- "clang-format",
		-- "rustfmt",
		-- "stylua",
		-- "yamlfmt",
		-- "prettierd"
		-- "black"
	},
})

local on_attach = function(client, bufnr)
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

	local bufopts = { noremap = true, silent = true, buffer = bufnr }
	vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
	vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
	vim.keymap.set("n", "<space>d", vim.diagnostic.open_float, opts)
	vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {})
	vim.keymap.set("n", "<leader>qf", vim.lsp.buf.code_action, {})

	vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {})
	vim.keymap.set("n", "gr", require("telescope.builtin").lsp_references, {})
	vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
	vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, bufopts)
	vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
	vim.keymap.set("n", "<space>wl", function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, bufopts)
	require("lsp-inlayhints").on_attach(client, bufnr)

	-- Makes the lsp not changing treesitter
	--client.server_capabilities.semanticTokensProvider = nil
end

local lsp_flags = {
	-- This is the default in Nvim 0.7+
	debounce_text_changes = 150,
}

-- Set up lspconfig. COMING FROM NVIM-CMP
local capabilities = require("cmp_nvim_lsp").default_capabilities()
-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
--require('lspconfig')['<YOUR_LSP_SERVER>'].setup {
--  capabilities = capabilities
--}
-- Set up lspconfig. COMING FROM NVIM-CMP STOP

require("lspconfig").lua_ls.setup({
	on_attach = on_attach,
	flags = lsp_flags,
	capabilities = capabilities,
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim", "opts" },
			},
		},
	},
})

require("lspconfig").bashls.setup({
	on_attach = on_attach,
	flags = lsp_flags,
	capabilities = capabilities,
})

require("lspconfig").clangd.setup({
	on_attach = on_attach,
	flags = lsp_flags,
	capabilities = capabilities,
	cmd = {
		-- see clangd --help-hidden
		"clangd",
		"--all-scopes-completion",
		--"--suggest-missing-includes",
		"--background-index",
		"--pch-storage=disk",
		--"--cross-file-rename",
		"--log=info",
		"--completion-style=detailed",
		"--enable-config", -- clangd 11+ supports reading from .clangd configuration file
		"--clang-tidy",
		"--offset-encoding=utf-16", --temporary fix for null-ls
		-- "--background-index",
		-- by default, clang-tidy use -checks=clang-diagnostic-*,clang-analyzer-*
		-- to add more checks, create .clang-tidy file in the root directory
		-- and add Checks key, see https://clang.llvm.org/extra/clang-tidy/
		--		"--clang-tidy",
		-- "--completion-style=bundled",
		-- "--cross-file-rename",
		-- "--header-insertion=iwyu",
	},
})
require("lspconfig").cmake.setup({
	on_attach = on_attach,
	flags = lsp_flags,
	capabilities = capabilities,
})
require("lspconfig").pyright.setup({
	on_attach = on_attach,
	flags = lsp_flags,
	capabilities = capabilities,
})
require("lspconfig").rust_analyzer.setup({
	on_attach = on_attach,
	flags = lsp_flags,
	capabilities = capabilities,
	settings = {
		-- to enable rust-analyzer settings visit:
		-- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
		["rust-analyzer"] = {
			-- enable clippy on save
			checkOnSave = {
				command = "clippy",
			},
		},
	},
})
require("lspconfig").yamlls.setup({
	on_attach = on_attach,
	flags = lsp_flags,
	capabilities = capabilities,
})

require("lspconfig").marksman.setup({
	on_attach = on_attach,
	flags = lsp_flags,
	capabilities = capabilities,
})

require("lspconfig").tsserver.setup({
	on_attach = on_attach,
	flags = lsp_flags,
	capabilities = capabilities,
})

require("lspconfig").html.setup({
	on_attach = on_attach,
	flags = lsp_flags,
	capabilities = capabilities,
	provideFormatter = true,
})

require("lspconfig").sqlls.setup({
	on_attach = on_attach,
	flags = lsp_flags,
	capabilities = capabilities,
})

-- require("lspconfig")["hls"].setup({
-- 	filetypes = { "haskell", "lhaskell", "cabal" },
-- 	on_attach = on_attach,
-- 	flags = lsp_flags,
-- 	capabilities = capabilities,
-- })

-- require("lspconfig").omnisharp.setup({
-- 	handlers = { ["textDocument/definition"] = require("omnisharp_extended").handler },
-- 	on_attach = on_attach,
-- 	flags = lsp_flags,
-- 	capabilities = capabilities,
-- })
