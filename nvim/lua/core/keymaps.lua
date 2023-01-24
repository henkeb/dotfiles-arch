vim.keymap.set("i", "<esc>OH", "<home>", {})

-- Edit configs
vim.keymap.set("n", "<leader>ve", ":edit ~/.config/nvim/init.lua<cr>", {})
vim.keymap.set("n", "<leader>vr", ":source ~/.config/nvim/init.lua<cr>", {})

-- window management
vim.keymap.set("n", "<leader>sv", "<C-w>v :wincmd l<CR>", { noremap = true })
vim.keymap.set("n", "<leader>sh", "<C-w>sv", { noremap = true })
vim.keymap.set("n", "<leader>se", "<C-w>=", { noremap = true })
vim.keymap.set("n", "<leader>sx", ":close<CR>", { noremap = true })

-- tabs management
vim.keymap.set("n", "<leader>to", ":tabnew<CR>", { noremap = true })
vim.keymap.set("n", "<leader>tx", ":tabclose<CR>", { noremap = true })
vim.keymap.set("n", "<leader>tn", ":tabn<CR>", { noremap = true })
vim.keymap.set("n", "<leader>tp", ":tabp<CR>", { noremap = true })
vim.keymap.set("n", "<leader>1", "1gt", { noremap = true })
vim.keymap.set("n", "<leader>2", "2gt", { noremap = true })
vim.keymap.set("n", "<leader>3", "3gt", { noremap = true })
vim.keymap.set("n", "<leader>4", "4gt", { noremap = true })
vim.keymap.set("n", "<leader>5", "5gt", { noremap = true })
vim.keymap.set("n", "<leader>6", "6gt", { noremap = true })
vim.keymap.set("n", "<leader>7", "7gt", { noremap = true })
vim.keymap.set("n", "<leader>8", "8gt", { noremap = true })
vim.keymap.set("n", "<leader>9", "9gt", { noremap = true })
vim.keymap.set("n", "<leader>0", ":tablast<cr>", { noremap = true })

vim.keymap.set("n", "<leader>Q", ":bufdo bwipeout", {})

vim.keymap.set("n", "<leader>ss", ":ClangdSwitchSourceHeader<CR>", {})

-- Ease
vim.keymap.set("n", "<leader>l", ":nohlsearch<CR>")
-- <Ctrl-l> redraws the screen and removes any search highlighting.
vim.keymap.set("n", "<C-l>", ":nohl<CR><C-l>", { noremap = true })
