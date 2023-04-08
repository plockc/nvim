-- import vista plugin safely
local setup, symbols = pcall(require, "symbols-outline")
if not setup then
	return
end

symbols.setup({
	keymaps = {
		-- doubleclick and Enter to navigate
		goto_location = { "<2-LeftMouse>", "<Cr>" },
	},
})
