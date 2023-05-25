-- Nvim tree
require("nvim-tree").setup({
  sort_by = "case_sensitive",
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})

local function open_nvim_tree(data)
  -- buffer is a directory
  local directory = vim.fn.isdirectory(data.file) == 1
  if not directory then
    return
  end
  -- change to the directory
  vim.cmd.cd(data.file)
  -- open the tree
  require("nvim-tree.api").tree.open()
end

vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })


-- Nerd Commenter
vim.g.NERDCreateDefaultMappings = 1
vim.g.NERDCompactSexyComs = 1


-- AutoPairs
vim.g.AutoPairsFlyMode = 0
vim.g.AutoPairsMultilineClose = 0


-- Airline
vim.g.airline_theme='catppuccin'

