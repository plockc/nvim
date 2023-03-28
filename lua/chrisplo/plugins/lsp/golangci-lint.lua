local h = require("null-ls.helpers")
local methods = require("null-ls.methods")
local log = require("null-ls.logger")

local DIAGNOSTICS_ON_SAVE = methods.internal.DIAGNOSTICS_ON_SAVE

return h.make_builtin({
	name = "chrisplo_golangci_lint",
	meta = {
		url = "https://golangci-lint.run/",
		description = "A Go linter aggregator.",
	},
	method = DIAGNOSTICS_ON_SAVE,
	filetypes = { "go" },
	generator_opts = {
		command = "golangci-lint",
		to_stdin = true,
		from_stderr = false,
		ignore_stderr = true,
		args = {
			"run",
			"--fix=false",
			"--out-format=json",
			"$FILENAME",
		},
		format = "json",
		check_exit_code = function(code)
			return code <= 2
		end,
		on_output = function(params)
			local diags = {}
			if params.output["Report"] and params.output["Report"]["Error"] then
				log:warn(params.output["Report"]["Error"])
				return diags
			end
			local issues = params.output["Issues"]
			if type(issues) == "table" then
				for _, d in ipairs(issues) do
					log:trace("filename " .. d.Pos.Filename)
					log:trace("bufname " .. params.bufname)
					--if d.Pos.Filename == params.bufname then
					if params.bufname:sub(-#d.Pos.Filename) == d.Pos.Filename then
						log:trace("inserting")
						table.insert(diags, {
							source = string.format("golangci-lint:%s", d.FromLinter),
							row = d.Pos.Line,
							col = d.Pos.Column,
							message = d.Text,
							severity = h.diagnostics.severities["warning"],
						})
					end
				end
			end
			return diags
		end,
	},
	factory = h.generator_factory,
})
