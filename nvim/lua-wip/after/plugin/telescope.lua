local builtin = require('telescope.builtin')
local actions = require('telescope.actions')

--close telescope on esc
require('telescope').setup({
    defaults = {
        mappings = {
            i = {
                ['<esc>'] = actions.close,
            },
        },
        -- borderchars = {
        -- prompt = { "─", " ", " ", " ", "─", "─", " ", " " },
        -- results = { " " },
        -- preview = { " " },
        -- },
    },
})

vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>bb', function() builtin.buffers({ sort_lastused = true }) end, {})
vim.keymap.set('n', '<leader><leader>', function()
    builtin.git_files({ show_untracked = true })
end)
vim.keymap.set('n', '<leader>/', function()
    builtin.grep_string({ search = vim.fn.input('Grep > ') })
end)

require('telescope').load_extension('fzf')
