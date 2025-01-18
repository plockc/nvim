return {
  {
    "mason_null_ls",
    opts = {
		-- list of formatters & linters for mason to install
		ensure_installed = {
			"prettier", -- ts/js formatter
			"stylua", -- lua formatter
			"eslint_d", -- ts/js linter
			"golangci-lint", -- golang linter
			"gospell", -- spelling in strings
		},
		-- auto-install configured formatters & linters (with null-ls)
		automatic_installation = true,
    },
  },
}

