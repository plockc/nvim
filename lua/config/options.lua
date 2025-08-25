-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- do not bundle ai completion under nvim-cmp so virtual text works
vim.g.ai_cmp = false

local opt = vim.opt

-- show filename at the top
local function getParentPath(path)
  path = path:gsub("\\", "/")
  -- Match everything up to the last slash (inclusive of the last directory name)
  local parent_path = path:match("(.*/)[^/]*$")

  -- Handle cases where the path is just a file in the current directory or a root directory
  if not parent_path then
    return "."
  end

  -- Remove trailing slash if it's not the root directory
  if parent_path ~= "/" then
    parent_path = parent_path:sub(1, -2)
  end

  return parent_path
end

function Get_rooted_path()
  local root = require("lazyvim.util").root()
  root = getParentPath(root)
  local path = vim.fn.expand("%:p") -- Full path

  if string.sub(path, 1, #root) == root then
    -- remove the root from path and the leading slash
    return string.sub(path, #root + 2)
  end
  return path
end

opt.winbar = "%{luaeval('Get_rooted_path()')} %m"

-- line numbering
--
-- opt.relativenumber = false

-- tabs and indentation
opt.tabstop = 4
opt.shiftwidth = 4
-- `opt.copyindent = true
-- opt.softtabstop = 4
-- opt.smarttab = true

-- visual line wrapping behavior
opt.wrap = true

-- backspace is can delete more things
opt.backspace = "indent,eol,start"

-- terminal
opt.title = true

-- auto save files
--opt.autowrite = true
-- save in other scenarios
--opt.autowriteall = true

-- highlight the current line number
opt.cursorlineopt = "number"

-- consider hyphenated words as not two words
--opt.iskeyword:append("-")
--opt.iskeyword:append("_")
