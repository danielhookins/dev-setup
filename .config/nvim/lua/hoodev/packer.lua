vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Telescope
  use {
      'nvim-telescope/telescope.nvim', tag = '0.1.2',
      -- or                            , branch = '0.1.x',
      requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- Tokyonight
  use 'folke/tokyonight.nvim'

  -- Treesitter
  use (
      'nvim-treesitter/nvim-treesitter',
      {run = ':TSUpdate'}
  )

  -- LSP
  use 'neovim/nvim-lspconfig'

end)
