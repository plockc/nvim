return {
	{
		'stevearc/conform.nvim',
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			format_on_save = {
				timeout_ms = 500,
				-- added recently, could cause slow saving
				async = false;
				-- should this be lsp_fallback = true ?
				lsp_format = "fallback",
			},
			formatters_by_ft = {
				go = {"goimports", "gofumpt"},
				yaml = { "prettier" },
				json = { "prettier" },
				markdown = { "prettier" },
			},
		},
	}
}
