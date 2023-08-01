return {
  "ThePrimeagen/harpoon",
  keys = {"<leader>ha", "<leader>hh"},
  config = function()
    local ui = require("harpoon.ui")
    local mark = require("harpoon.mark")

    vim.keymap.set('n', '<leader>ha', mark.add_file, {})
    vim.keymap.set('n', '<leader>hh', ui.toggle_quick_menu, {})

    vim.keymap.set('n', '<leader>1', function() ui.nav_file(1) end, {})
    vim.keymap.set('n', '<leader>2', function() ui.nav_file(2) end, {})
    vim.keymap.set('n', '<leader>3', function() ui.nav_file(3) end, {})
    vim.keymap.set('n', '<leader>4', function() ui.nav_file(4) end, {})
    vim.keymap.set('n', '<leader>5', function() ui.nav_file(5) end, {})
  end
}
