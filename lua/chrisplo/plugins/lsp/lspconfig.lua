-- import lspconfig plugin safely
local lspconfig_status, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status then
	return
end

-- import cmp-nvim-lsp plugin safely
local cmp_nvim_lsp_status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_nvim_lsp_status then
	return
end

-- enable keybinds only for when lsp server available
local on_attach = function(client, bufnr)
	-- keybind options
	local opts = { noremap = true, silent = true, buffer = bufnr }

	local function map(mode, lhs, rhs)
		vim.keymap.set(mode, lhs, rhs, opts)
	end

	-- set keybinds
	map("n", "gf", "<cmd>Lspsaga lsp_finder<CR>") -- show definition, references
	map("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>") -- got to declaration
	map("n", "gd", "<cmd>Lspsaga peek_definition<CR>") -- see definition and make edits in window
	map("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>") -- go to implementation
	map("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>") -- see available code actions
	map("n", "<leader>rn", "<cmd>Lspsaga rename<CR>") -- smart rename
	map("n", "<leader>D", "<cmd>Lspsaga show_line_diagnostics<CR>") -- show  diagnostics for line
	map("n", "<leader>d", "<cmd>Lspsaga show_cursor_diagnostics<CR>") -- show diagnostics for cursor
	map("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>") -- jump to previous diagnostic in buffer
	map("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>") -- jump to next diagnostic in buffer
	map("n", "K", "<cmd>Lspsaga hover_doc<CR>") -- show documentation for what is under cursor
	map("n", "<leader>o", "<cmd>SymbolsOutline<CR>") -- see outline on right hand side
end

-- used to enable autocompletion (assign to every lsp server config)
local capabilities = cmp_nvim_lsp.default_capabilities()

-- configure lsp servers for interesting languages
lspconfig["gopls"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
	analyses = {
		unusedvariable = true,
		unusedparams = true,
	},
})

-- configure html server
lspconfig["html"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})
-- configure css server
lspconfig["cssls"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

-- configure lua server (with special settings)
lspconfig["lua_ls"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
	settings = { -- custom settings for lua
		Lua = {
			-- make the language server recognize "vim" global
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				-- make language server aware of runtime files
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.stdpath("config") .. "/lua"] = true,
				},
			},
		},
	},
})
