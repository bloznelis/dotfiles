return {
  -- 'bloznelis/before.nvim',
  dir = "/home/lukas/code/lua/before.nvim",
  config = function()
    local before = require('before')
    before.setup({
      -- How many edit locations to store in memory (default: 10)
      history_size = 42,
      -- Wrap around the ends of the edit history (default: false)
      history_wrap_enabled = false
    })

    vim.keymap.set('n', '<C-h>', before.jump_to_last_edit, {})
    vim.keymap.set('n', '<C-l>', before.jump_to_next_edit, {})
    vim.keymap.set('n', '<leader>oe', before.show_edits_in_quickfix, {})
  end
}
