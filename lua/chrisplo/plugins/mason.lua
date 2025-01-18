
return {
  -- can install binaries and makes them available to plugins
  {
    "williamboman/mason.nvim",
  	dependencies = {
      -- registers hook with lspconfig to configure mason installed servers
      "williamboman/mason-lspconfig.nvim",
  	  "WhoIsSethDaniel/mason-tool-installer.nvim",
	},
  	config = function()
      local mason = require("mason")
      local mason_lspconfig = require("mason-lspconfig")
      local mason_tool_installer = require("mason-tool-installer")
  	  mason.setup({})
      -- see lspconfig.lus for the remaining config
      mason_lspconfig.setup({
    	-- install lspconfig defined packages automatically?
    	automatic_installation = true,
    	-- use lspconfig server names below, not mason.nvim names
    	ensure_installed = {
			"gopls",
			"bashls",
			"lua_ls",
			"yamlls",
			"jqls",
		},
      })
      mason_tool_installer.setup({
  	  	  ensure_installed = {
  		  	  "prettier",
  		  	  -- intead of pylint
  		  	  "ruff",
  		  	  "golangci-lint",
  		  	  "goimports",
  		  	  "gofumpt",
  		  },
      })
    end
  }
}
