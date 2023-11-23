return {
  "phaazon/hop.nvim",
  keys = { "gs<leader>" },
  config = function()
    local hop = require('hop')

    vim.keymap.set('n', 'gs<leader>', function()
      hop.hint_patterns({ multi_windows = true })
    end)

    hop.setup()
  end
}
