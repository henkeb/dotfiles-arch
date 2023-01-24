vim.o.termguicolors = true
-- vim.o.background = "dark" -- or "light" for light mode
-- vim.cmd([[colorscheme gruvbox]])
vim.cmd([[
 " Important!!
        " For dark version.
        set background=dark
        " Set contrast.
        " This configuration option should be placed before `colorscheme gruvbox-material`.
        " Available values: 'hard', 'medium'(default), 'soft'
        let g:gruvbox_material_background = 'hard'
        " For better performance
        let g:gruvbox_material_better_performance = 1
        colorscheme gruvbox-material
]])
--vim.o.background = "dark" -- or "light" for light mode
