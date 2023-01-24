require("nvim-treesitter.configs").setup({
  ensure_installed = { "cpp", "lua", "rust", "bash", "python", "vim" },

  sync_install = true,
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
})
