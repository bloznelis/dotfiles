return {
  "folke/zen-mode.nvim",
  keys =  "<leader>zz",
  config = function()
    vim.keymap.set("n", "<leader>zz", function()
      require("zen-mode").setup {
        window = {
          width = 130,
          options = {}
        },
        plugins = {
          alacritty = {
            enabled = true,
            font = "14",
          },
        },
      }
      require("zen-mode").toggle()
    end)
  end
}
