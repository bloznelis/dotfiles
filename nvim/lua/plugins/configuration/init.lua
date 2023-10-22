return {
  -- colors
  --use 'folke/tokyonight.nvim'
  --use 'AlexvZyl/nordic.nvim'
  --use 'navarasu/onedark.nvim'
  --use 'sainnhe/gruvbox-material'
  --use 'shaunsingh/nord.nvim'
  --use 'shaunsingh/solarized.nvim'
  "rebelot/kanagawa.nvim",
  --use "rose-pine/neovim"

  -- syntax
  { "nvim-treesitter/nvim-treesitter",          build = ":TSUpdate" },
  "elkowar/yuck.vim",
  "NoahTheDuke/vim-just",

  -- telescope --
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.3',
    -- or                            , branch = '0.1.x',
    dependencies = { { 'nvim-lua/plenary.nvim' } }
  },
  { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  { 'nvim-telescope/telescope-project.nvim' },

  -- icons
  'nvim-tree/nvim-web-devicons',

  -- lualine
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons', opt = true }
  },

  -- clojure
  'Olical/conjure',

  -- nvim-tree
  {
    'nvim-tree/nvim-tree.lua',
    dependencies = {
      'nvim-tree/nvim-web-devicons', -- optional, for file icons
    }
  },

  -- surround
  'echasnovski/mini.nvim',
  "kylechui/nvim-surround",

  -- auto closing brackets
  "windwp/nvim-autopairs",

  -- git
  "lewis6991/gitsigns.nvim",

  -- misc
  "folke/zen-mode.nvim",
  "phaazon/hop.nvim",
  "ThePrimeagen/harpoon",

  -- LSP
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    dependencies = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' }, -- Required
      -- { 'williamboman/mason.nvim' }, -- Optional
      -- { 'williamboman/mason-lspconfig.nvim' }, -- Optional

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
  },
  { 'scalameta/nvim-metals', dependencies = { "nvim-lua/plenary.nvim" } },
}
