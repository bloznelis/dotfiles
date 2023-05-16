-- Only required if you have packer configured as `opt`
vim.cmd.packadd('packer.nvim')

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- colors
    use 'folke/tokyonight.nvim'
    use 'AlexvZyl/nordic.nvim'
    use 'navarasu/onedark.nvim'
    use 'sainnhe/gruvbox-material'
    use 'shaunsingh/nord.nvim'
    use 'shaunsingh/solarized.nvim'
    use "rebelot/kanagawa.nvim"
    use "rose-pine/neovim"
    use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })

    -- telescope --
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.1',
        -- or                            , branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }
    use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }


    -- icons
    use 'nvim-tree/nvim-web-devicons'

    -- lualine
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }

    -- nvim-tree
    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons', -- optional, for file icons
        }
    }

    -- surround
    use({
        "kylechui/nvim-surround",
        tag = "*", -- Use for stability; omit to use `main` branch for the latest features
    })

    -- auto closing brackets
    use("windwp/nvim-autopairs")

    -- git
    use("lewis6991/gitsigns.nvim")
    use { 'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim' }

    -- misc
    use("folke/zen-mode.nvim")
    use("mbbill/undotree")
    use("preservim/nerdcommenter")
    use("phaazon/hop.nvim")
    use("elkowar/yuck.vim")
    use("ThePrimeagen/harpoon")

    -- LSP
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v1.x',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' }, -- Required
            --                  {'williamboman/mason.nvim'},           -- Optional
            --                  {'williamboman/mason-lspconfig.nvim'}, -- Optional

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' }, -- Required
            { 'hrsh7th/cmp-nvim-lsp' }, -- Required
            { 'hrsh7th/cmp-buffer' }, -- Optional
            { 'hrsh7th/cmp-path' }, -- Optional
            { 'saadparwaiz1/cmp_luasnip' }, -- Optional
            { 'hrsh7th/cmp-nvim-lua' }, -- Optional

            -- Snippets
            { 'L3MON4D3/LuaSnip' }, -- Required
            { 'rafamadriz/friendly-snippets' }, -- Optional
        }
    }
    use({'scalameta/nvim-metals', requires = { "nvim-lua/plenary.nvim" }})
end)
