--vim.o.termguicolors = true
-- vim.o.background = "dark" -- or "light" for light mode
-- vim.cmd([[colorscheme gruvbox]])
vim.cmd([[
 " Important!!
        " For dark version.
        if has('termguicolors')
          set termguicolors
        endif

        set background=dark
        " Set contrast.
        " This configuration option should be placed before `colorscheme gruvbox-material`.
        " Available values: 'hard', 'medium'(default), 'soft'
        let g:gruvbox_material_background = 'medium'
        " For better performance
        let g:gruvbox_material_better_performance = 1

        let g:gruvbox_material_foreground = 'material'
        colorscheme gruvbox-material
]])
--vim.o.background = "dark" -- or "light" for light mode
