return {
  "hedyhli/outline.nvim",
  keys = {
    { "<leader>o", "<cmd>Outline<CR>", desc = "Toggle outline" },
  },
  opts = {
    -- instead of up and down arrows
    keymaps = {
      up_and_jump = "<C-p>",
      down_and_jump = "<C-n>",
    },
    outline_window = {
      --position = "left",
      width = 30,
      relative_width = false,
      auto_jump = false,
      -- focus_on_open = false,
    },
    preview_window = {
      auto_preview = true,
      open_hover_on_preview = true,
      min_width = 80,
      width = 40,
      min_height = 10,
      height = 60,
      border = "rounded",
      -- 5% transparent preview
      winblend = 5,
    },
  },
}
