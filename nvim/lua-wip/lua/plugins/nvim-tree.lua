return {
  "nvim-tree/nvim-tree.lua",
  lazy = false,
  keys = {
    { "<leader>op", "<cmd> NvimTreeToggle<CR>", desc = "NvimTreeToggle"},
    { "<leader>oP", "<cmd> NvimTreeFindFile<CR>", desc = "NvimTreeFindFile"},
  },
  config = function()
    -- disable netrw at the very start of your init.lua (strongly advised)
    -- vim.g.loaded_netrw = 1
    -- vim.g.loaded_netrwPlugin = 1

    -- set termguicolors to enable highlight groups
    vim.opt.termguicolors = true

    -- empty setup using defaults
    require("nvim-tree").setup({
      sync_root_with_cwd = true,
      respect_buf_cwd = true,
      view = { adaptive_size = true }
    })
  end
}
