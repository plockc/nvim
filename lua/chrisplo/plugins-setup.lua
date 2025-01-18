-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end

vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim
require("lazy").setup({
  change_detection = {
  	notify = false,
  },
  spec = {
    -- import your plugins
    { import = "chrisplo.plugins" },
  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "moonfly" } },
  -- automatically check for plugin updates
  checker = { enabled = true },
})

-- return packer.startup(function(use)
-- 	use("nvim-lua/plenary.nvim") -- lua functions that many plugins use
-- 
-- 	-- enhanced lsp uis
-- 	use({
-- 		"glepnir/lspsaga.nvim",
-- 		branch = "main",
-- 		requires = {
-- 			{ "nvim-tree/nvim-web-devicons" },
-- 		},
-- 	})
-- 
-- 	-- formatting & linting
-- 	-- null-ls deprecated, none-ls is the takeover project
-- 	use("nvimtools/none-ls.nvim") -- configure formatters & linters
-- 	use("jayp0521/mason-null-ls.nvim") -- bridges gap b/w mason & null-ls
-- 
-- 	-- lsp based navigator, like tagbar was for ctags
-- 	use("simrat39/symbols-outline.nvim")
-- 
-- end)
