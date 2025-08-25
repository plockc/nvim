return {
  "neovim/nvim-lspconfig",
  opts = function()
    local Keys = require("lazyvim.plugins.lsp.keymaps").get()
    -- stylua: ignore
    vim.list_extend(Keys, {
      { "<leader>fi", "<cmd>FzfLua lsp_incoming_calls jump1=true ignore_current_line=true<cr>", desc = "Goto [i]ncoming Call" },
      { "<leader>fo", "<cmd>FzfLua lsp_outgoing_calls jump1=true ignore_current_line=true<cr>", desc = "Goto [o]utgoing call" },
    })
  end,
}
