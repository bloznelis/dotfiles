return {
  'stevearc/overseer.nvim',
  event = "VeryLazy",
  config = function ()
    local overseer = require('overseer')
    overseer.setup()

    vim.keymap.set("n", "<leader>oo", function ()
      overseer.toggle()
    end)
    vim.keymap.set("n", "<leader>or", function ()
      overseer.run_template()
    end)
  end
}
