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
  use { "catppuccin/nvim", as = "catppuccin" }
  use {
    "nvim-neo-tree/neo-tree.nvim",
      branch = "v2.x",
      requires = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
      }
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
  -- COC plugins end

  use { 'ntpeters/vim-better-whitespace' }
  use { 'tpope/vim-surround' }
  use { 'preservim/nerdcommenter' }
  use { 'editorconfig/editorconfig-vim' }
  use {'jiangmiao/auto-pairs' }
  use { 'vim-airline/vim-airline' }

  use { 'airblade/vim-gitgutter' }
  use({
    "nvim-telescope/telescope.nvim",
    requires = { { "nvim-lua/plenary.nvim" }, { "kdheepak/lazygit.nvim" } },
    config = function()
        require("telescope").load_extension("lazygit")
    end,
  })
end)