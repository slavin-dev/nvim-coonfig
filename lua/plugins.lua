local packer = require("packer")

-- Have packer use a popup window
packer.init({
    display = {
      open_fn = function()
        return require('packer.util').float({ border = 'single' })
      end
    }
  }
)

packer.startup(function(use)
  use { "wbthomason/packer.nvim" }
  use { "Mofiqul/dracula.nvim" }
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional
    },
    config = function()
      require("nvim-tree").setup {}
    end
  }
  -- COC plugins begin
  use { 'neoclide/coc.nvim', branch='release' }
  use { 'neoclide/coc-tsserver', run='yarn install --frozen-lockfile' }
  use { 'neoclide/coc-json', run='yarn install --frozen-lockfile' }
  use { 'neoclide/coc-html', run='yarn install --frozen-lockfile' }
  use { 'neoclide/coc-css', run='yarn install --frozen-lockfile' }
  use { 'neoclide/coc-eslint', run='yarn install --frozen-lockfile' }
  use { 'neoclide/coc-tslint', run='yarn install --frozen-lockfile' }
  use { 'neoclide/coc-prettier', run='yarn install --frozen-lockfile' }
  use { 'fannheyward/coc-styled-components', run='yarn install --frozen-lockfile' }
  use { 'iamcco/coc-diagnostic', run='yarn install --frozen-lockfile' }
  use { 'neoclide/coc-emmet', run='yarn install --frozen-lockfile' }
  use { 'neoclide/coc-snippets', run='yarn install --frozen-lockfile' }
  -- COC plugins end

  use { 'ntpeters/vim-better-whitespace' }
  use { 'tpope/vim-surround' }
  use { 'preservim/nerdcommenter' }
  use { 'editorconfig/editorconfig-vim' }
  use {'jiangmiao/auto-pairs' }
  use { 'vim-airline/vim-airline' }

  use { 'airblade/vim-gitgutter' }
  use { 'tpope/vim-fugitive' }
  use({
    "nvim-telescope/telescope.nvim",
    requires = { "nvim-lua/plenary.nvim" },
  })
  use { 'nvim-telescope/telescope-live-grep-args.nvim' }
  use({
    "princejoogie/dir-telescope.nvim",
    -- telescope.nvim is a required dependency
    requires = {"nvim-telescope/telescope.nvim"},
    config = function()
      require("dir-telescope").setup({
        -- these are the default options set
        hidden = true,
        no_ignore = false,
        show_preview = true,
      })
    end,
  })

  use { 'kevinhwang91/nvim-bqf', ft = 'qf'}
  use({
    'junegunn/fzf', run = function()
      vim.fn['fzf#install']()
    end
  })
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use { 'alvan/vim-closetag' }
  use { 'gennaro-tedesco/nvim-peekup' }
  use { 'NvChad/nvim-colorizer.lua' }
  -- use { 'Bekaboo/dropbar.nvim' }
  use { 'lewis6991/gitsigns.nvim' }
  use { 'romgrk/barbar.nvim' }
  use { 'sindrets/diffview.nvim' }
  use {
    'TimUntersberger/neogit',
    requires = {
      'nvim-lua/plenary.nvim',
      'sindrets/diffview.nvim'
    }
  }
  use { 'nvim-neorg/neorg' }
end)
