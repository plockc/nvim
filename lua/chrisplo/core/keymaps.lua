vim.g.mapleader = " "

local function map(mode, lhs, rhs, opts)
	local options = { noremap = true, silent = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- useful for slide presentations
-- map("n", "<Left>", "bp<CR>")
-- map("n", "<Right>", "bn<CR>")

map("n", "j", "gj")
map("n", "k", "gk")
map("n", ";", ":")

-- open definition under cursor in vertical split, as opposed to `C-w ]` which opens horizontally
map("n", "<leader>]", ":vert winc ]<CR>")

-- send deletes to black hole
map("n", "d", '"_d')
map("v", "d", '"_d')

-- tabs
map("n", "<leader>to", ":tabnew<CR>") -- open new tab
map("n", "<leader>tx", ":tabclose<CR>") -- close current tab
map("n", "<leader>tn", ":tabn<CR>") --  go to next tab
map("n", "<leader>tp", ":tabp<CR>") --  go to previous tab
map("n", "<F2>", ":NvimTreeToggle<CR>") --  go to previous tab
