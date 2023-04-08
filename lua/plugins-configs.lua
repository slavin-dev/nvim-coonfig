-- NeoTree
require("neo-tree").setup({
  close_if_last_window = false, -- Close Neo-tree if it is the last window left in the tab
  popup_border_style = "rounded",
  enable_git_status = true,
  enable_diagnostics = true,
  filesystem = {
    filtered_items = {
      visible = true,
      hide_dotfiles = false,
      hide_gitignored = true,
    },
  },
})

vim.cmd([[nnoremap \ :Neotree reveal<cr>]])

-- Nerd Commenter
vim.g.NERDCreateDefaultMappings = 1
vim.g.NERDCompactSexyComs = 1

-- AutoPairs
vim.g.AutoPairsFlyMode = 0
vim.g.AutoPairsMultilineClose = 0

-- Airline
vim.g.airline_theme='catppuccin'
