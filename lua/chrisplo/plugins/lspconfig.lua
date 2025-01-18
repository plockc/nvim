return {
  {
  	"neovim/nvim-lspconfig",
  	event = { "BufReadPre", "BufNewFile"},
  	dependencies = {
		"hrsh7th/cmp-nvim-lsp", -- source for lsp based completion
		-- rename imports on file renames, etc.
		{ "antosha417/nvim-lsp-file-operations", config = true},
		-- lua for neovim improvments
		{ "folke/neodev.nvim", opts = {} },
		"williamboman/mason-lspconfig.nvim",
		-- also in nvim-cmp.lua as a source, used here for enhanced capabilities to send to the completion
	},
    config = function()
    	-- every lsp config will get these capabilities, which are advanced
    	-- from the default
		local capabilities = require('cmp_nvim_lsp').default_capabilities()
		local lspconfig = require("lspconfig")
		local mason_lspconfig = require("mason-lspconfig")
		local lsp_on_attach_lsp_format = function(client, bufnr)
			require("lsp-format").on_attach(client, bufnr)
		end

		mason_lspconfig.setup_handlers({
			-- this default handler will be called for each server
			-- that doesn't hav e a specific handler,
			-- enables advanced capabilities
			function(server_name)
				lspconfig[server_name].setup({
					capabilities = capabilities,
				})
			end,
			-- gopls lspconfig handler for setup
			["gopls"] = function()
				lspconfig["gopls"].setup({
					capabilities = capabilities,
					-- will eventually setup formatting
					-- on_attach = lsp_on_attach_lsp_format,
					analyses = {
						unusedvariable = true,
						unusedparams = true,
					},
					init_options = {
					  usePlaceholders = true,
					},
					-- cmd = {'gopls'},
					settings = { gopls = {
						experimentalPostfixCompletions = true,
						analyses = {
						  unusedparams = true,
						  shadow = true,
						},
						staticcheck = true,
						env = { GOFLAGS = "-tags=test" },
					} },
				})
			end -- gopls function
		})
    end, -- config function
  },
}

-- enable keybinds only for when lsp server available
-- local on_attach = function(client, bufnr)
-- 	-- keybind options
-- 	local opts = { noremap = true, silent = true, buffer = bufnr }
-- 
-- 	local function map(mode, lhs, rhs)
-- 		vim.keymap.set(mode, lhs, rhs, opts)
-- 	end
-- 
-- 	-- set keybinds
-- 	map("n", "gf", "<cmd>Lspsaga lsp_finder<CR>") -- show definition, references
-- 	map("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>") -- got to declaration
-- 	map("n", "gd", "<cmd>Lspsaga peek_definition<CR>") -- see definition and make edits in window
-- 	map("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>") -- go to implementation
-- 	map("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>") -- see available code actions
-- 	map("n", "<leader>rn", "<cmd>Lspsaga rename<CR>") -- smart rename
-- 	map("n", "<leader>D", "<cmd>Lspsaga show_line_diagnostics<CR>") -- show  diagnostics for line
-- 	map("n", "<leader>d", "<cmd>Lspsaga show_cursor_diagnostics<CR>") -- show diagnostics for cursor
-- 	map("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>") -- jump to previous diagnostic in buffer
-- 	map("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>") -- jump to next diagnostic in buffer
-- 	map("n", "K", "<cmd>Lspsaga hover_doc<CR>") -- show documentation for what is under cursor
-- 	map("n", "<leader>o", "<cmd>SymbolsOutline<CR>") -- see outline on right hand side
-- end
-- 
-- -- used to enable autocompletion (assign to every lsp server config)
-- local capabilities = cmp_nvim_lsp.default_capabilities()
-- 
-- -- configure lsp servers for interesting languages
-- lspconfig["gopls"].setup({
-- 	capabilities = capabilities,
-- 	on_attach = on_attach,
-- 	analyses = {
-- 		unusedvariable = true,
-- 		unusedparams = true,
-- 	},
-- 	settings = { gopls = {
-- 		env = { GOFLAGS = "-tags=test" },
-- 	} },
-- })
-- 
-- -- configure html server
-- lspconfig["html"].setup({
-- 	capabilities = capabilities,
-- 	on_attach = on_attach,
-- })
-- -- configure css server
-- lspconfig["cssls"].setup({
-- 	capabilities = capabilities,
-- 	on_attach = on_attach,
-- })
-- 
-- -- configure lua server (with special settings)
-- lspconfig["lua_ls"].setup({
-- 	capabilities = capabilities,
-- 	on_attach = on_attach,
-- 	settings = { -- custom settings for lua
-- 		Lua = {
-- 			-- make the language server recognize "vim" global
-- 			diagnostics = {
-- 				globals = { "vim" },
-- 			},
-- 			workspace = {
-- 				-- make language server aware of runtime files
-- 				library = {
-- 					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
-- 					[vim.fn.stdpath("config") .. "/lua"] = true,
-- 				},
-- 			},
-- 		},
-- 	},
-- })
