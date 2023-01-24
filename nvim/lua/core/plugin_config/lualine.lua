require("lualine").setup({
	options = {
		icons_enables = true,
		theme = "gruvbox-material",
	},
	sections = {
		lualine_a = {
			{
				"filename",
				path = 1,
			},
		},
	},
})
