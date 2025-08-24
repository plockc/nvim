return {
  "akinsho/bufferline.nvim",
  keys = {
    { "<leader>bb", "<cmd>BufferLinePick<CR>", desc = "Buffer Picker" },
  },
  opts = {
    options = {
      -- tabs mode will do whole sets of windows instead of
      -- showing which tabs are available for current buffer
      -- mode = "tabs"
      indicator = {
        style = "underline",
      },
      separator_style = "slant",
    },
  },
}
