return {
  'echasnovski/mini.comment',
  version = false,
  config = function()
    require('mini.comment').setup()
  end
}
-- return {
--   "terrortylor/nvim-comment",
--   keys = {
--     { "<C-_>", "<cmd> :CommentToggle<CR>", desc = "Comment" },
--   },
--   config = function()
--     require('nvim_comment').setup()
--
--     vim.keymap.set("n", "<C-_>", vim.cmd.CommentToggle)
--     vim.keymap.set("v", "<C-_>", '<,'>vim.cmd.CommentToggle)
--
--   end
-- }
