-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.g.mapleader = " "

local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

map("n", ";", ":")

-- useful for slide presentations
-- map("n", "<Left>", "bp<CR>")
-- map("n", "<Right>", "bn<CR>")

-- open definition under cursor in vertical split, as opposed to `C-w ]` which opens horizontally
map("n", "<leader>]", ":vert winc ]<CR>")

-- send deletes to black hole
-- for cut use 'v' instead
map("n", "d", '"_d')
map("v", "d", '"_d')
