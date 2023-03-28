local opt = vim.opt

-- line numbering
opt.relativenumber = false
opt.number = true

-- tabs and indentation
opt.tabstop = 4
opt.shiftwidth = 4
opt.shiftround = true
opt.copyindent = true
opt.softtabstop = 4
opt.smarttab = true

-- line wrapping

-- wrapping behavior
opt.wrap = true
opt.backspace = "indent,eol,start"
-- go up and down visually wrapped lines as if they were actually wrapped

-- undo
opt.undofile = true
opt.backup = false

-- terminal
opt.title = true

-- stuff
opt.hlsearch = true
-- auto re-read files that have changed
opt.autoread = true

-- searching
opt.wrapscan = true
opt.incsearch = true
opt.smartcase = true
opt.ignorecase = true

-- visual
opt.cursorline = true
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

-- clipboard
opt.clipboard:append("unnamed")
-- send deletes to black hole
vim.api.nvim_set_keymap('n', 'd', '"_d', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', 'd', '"_d', { noremap = true, silent = true })

-- consider hyphenated words as not two words
opt.iskeyword:append("-")


