if pcall(require, 'packer') then
    require('packer').init()
else
    vim.cmd [[packadd packer.nvim]]
end


return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- Telescope
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.2',
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

    -- Git
    use 'tpope/vim-fugitive'

    -- Statusline
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }
end)
