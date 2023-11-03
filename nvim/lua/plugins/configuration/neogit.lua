return {
  "NeogitOrg/neogit",
  keys = "<leader>gg",
  dependencies = {
    "nvim-lua/plenary.nvim",         -- required
    "nvim-telescope/telescope.nvim", -- optional
    "sindrets/diffview.nvim",        -- optional
  },
  config = function()
    require('neogit').setup({
      disable_commit_confirmation = true,
      mappings = {
        popup = {
          ["F"] = "PullPopup"
        }
      }
    })
    vim.keymap.set("n", "<leader>gg", vim.cmd.Neogit)
  end
}
