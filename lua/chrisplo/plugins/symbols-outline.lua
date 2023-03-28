-- import vista plugin safely
local setup, symbols = pcall(require, "symbols-outline")
if not setup then
	return
end

symbols.setup({})
