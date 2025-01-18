return {
  {
  	"bluz71/vim-moonfly-colors",
    name = "moonfly",
    lazy = false,
    priority = 1000,
    config = function()
    	-- load the colorscheme
    	vim.cmd([[colorscheme moonfly]])
    end,
  },
}

