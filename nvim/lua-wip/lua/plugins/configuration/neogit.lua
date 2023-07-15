return {
  "TimUntersberger/neogit",
  keys = "<leader>gg",
  dependencies = 'nvim-lua/plenary.nvim' ,
  config = function()
    require('neogit').setup({ disable_commit_confirmation = true })
    vim.keymap.set("n", "<leader>gg", vim.cmd.Neogit)
  end
}
