return {
  'stevearc/oil.nvim',
  -- keys = {
  --   { "<leader>op", "<cmd>Oil<CR>", desc = "Oil open file" },
  -- },
  opts = {
    default_file_explorer = true,
    keymaps = {
      ["q"] = "actions.close",
      ["h"] = "actions.parent"
    },
  },
  dependencies = { "nvim-tree/nvim-web-devicons" },
}
