return {
  -- 'bloznelis/before.nvim',
  dir = "/home/lukas/code/lua/before.nvim",
  config = function()
    local before = require('before')
    before.setup()

    vim.keymap.set('n', '<C-h>', before.jump_to_last_edit, {})
    vim.keymap.set('n', '<C-l>', before.jump_to_next_edit, {})
    vim.keymap.set('n', '<leader>oe', before.show_edits_in_quickfix, {})
  end
}
