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

  { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  { 'nvim-telescope/telescope-project.nvim' },

  -- icons
  'nvim-tree/nvim-web-devicons',

  -- auto closing brackets
  "windwp/nvim-autopairs",

  -- git
  "lewis6991/gitsigns.nvim",

  -- misc
  "phaazon/hop.nvim",
  "ThePrimeagen/harpoon",
}
