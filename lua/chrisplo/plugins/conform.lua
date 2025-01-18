return {
	{
		"stevearc/conform.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			local conform = require("conform")
			conform.setup({
				format_on_save = {
					timeout_ms = 500,
					-- added recently, could cause slow saving
					async = false,
					-- should this be lsp_fallback = true ?
					lsp_format = "fallback",
				},
				formatters_by_ft = {
					go = { "goimports", "gofumpt" },
					yaml = { "prettier" },
					json = { "prettier" },
					markdown = { "prettier" },
					lua = { "stylua" },
				},
			})
			vim.keymap.set({ "n", "v" }, "<leader>mp", function()
				conform.format({
					lsp_fallback = true,
					async = false,
					timeout_ms = 1000,
				})
			end, { desc = "Format file or range (in visual mode)" })
		end,
	},
}
