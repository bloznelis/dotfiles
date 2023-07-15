return {
  "terrortylor/nvim-comment",
  keys = { "gc", "<C-_>" },
  config = function()
    require('nvim_comment').setup()

    vim.keymap.set("n", "<C-_>", vim.cmd.CommentToggle)

  end
}
