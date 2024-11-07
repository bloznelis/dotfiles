return {
  "NeogitOrg/neogit",
  enabled = true,
  keys = "<leader>gg",
  -- commit = "a32f99a83d636ea7cd62cda6e24d76d14e5579ba",
  dependencies = {
    "nvim-lua/plenary.nvim",         -- required
    "nvim-telescope/telescope.nvim", -- optional
    "sindrets/diffview.nvim",        -- optional
  },
  config = function()
    require('neogit').setup {
      auto_refresh = true,
      mappings = {
        popup = {
          ["F"] = "PullPopup"
        }
      }
    }
    vim.keymap.set("n", "<leader>gg", function()
      -- local git_root = vim.fn.system("git rev-parse --show-toplevel 2> /dev/null") -- Get git root
      -- require('neogit').open({ cwd = git_root })
      require('neogit').open()
    end)
  end
}
