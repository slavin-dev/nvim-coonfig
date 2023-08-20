-- Nvim tree
require("nvim-tree").setup({
  sort_by = "case_sensitive",
  renderer = {
    group_empty = true,
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


-- Tree Sittter
require'nvim-treesitter.configs'.setup {
  ensure_installed = { "typescript", "tsx", "lua", "html", "javascript", "org", "norg" },
  highlight = {
    enable = true,
    auto_install = true,
    additional_vim_regex_highlighting = {'org', 'norg'},
  },
  indent = { enable = true },
}

-- Telescope
require('telescope').load_extension('dir')
require('telescope').load_extension('live_grep_args')

-- Colorized
require('colorizer').setup()

-- Neogit
local neogit = require('neogit')
neogit.setup {
  auto_refresh = true,
  integrations = {
    diffview = true
  }
}

-- NEOrg
require('neorg').setup {
 load = {
    ["core.defaults"] = {},
    ["core.dirman"] = {
      config = {
        workspaces = {
          home = "~/workspace/orgs",
        }
      }
    },
    ["core.ui.calendar"] = {}
  }
}
