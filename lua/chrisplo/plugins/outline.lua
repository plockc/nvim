return {
	{
		"hedyhli/outline.nvim",
		lazy = true,
		cmd = { "Outline", "OutlineOpen" },
		opts = {
			preview_window = {
				auto_preview = true,
				open_hover_on_preview = true,
				width = 80,
				height = 60, -- relative
				relative_width = false,
			},
			width = 30,
			-- focus_on_open = false,
			relative_width = false,
		},
		keys = { -- Example mapping to toggle outline
			{ "<leader>o", "<cmd>Outline!<CR>", desc = "Toggle outline" },
			{ "<leader>O", "<cmd>Outline<CR>", desc = "Toggle outline" },
		},
	},
}
