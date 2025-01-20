return {
	{
		"nvim-lualine/lualine.nvim",
		opts = {
			globalstatus = true,
			sections = {
				lualine_b = {
					"diagnostics",
					"filename",
					{
						"filename",
						path = 3,
					},
				},
				lualine_c = {},
				lualine_x = { "diff", "branch" },
				lualine_y = {},
			},
			inactive_sections = {
				lualine_a = { "branch", "diff", "diagnostics" },
			},
		},
	},
}
