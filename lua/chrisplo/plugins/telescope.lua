-- import nvim-tree plugin safely
local setup, telescope = pcall(require, "telescope")
if not setup then
  return
end


-- import telescope actions safely
local actions_setup, actions = pcall(require, "telescope.actions")
if not actions_setup then
  return
end

-- configure telescope
telescope.setup({
}
)

telescope.load_extension("fzf")
