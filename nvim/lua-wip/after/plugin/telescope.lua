local builtin = require('telescope.builtin')
local actions = require('telescope.actions')

--close telescope on esc
require('telescope').setup({
    defaults = {
        mappings = {
            i = {
                ['<esc>'] = actions.close,
                ['<c-d>'] = actions.delete_buffer
            },
            n = {
                ['<c-d>'] = actions.delete_buffer
            }
        },
    },
})

--vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>bb', function() builtin.buffers({ sort_lastused = true }) end, {})
vim.keymap.set('n', '<leader><leader>', function()
    if pcall(builtin.git_files, { show_untracked = true }) then
    else
        builtin.find_files()
    end
end)
vim.keymap.set('n', '<leader>/', function()
    builtin.grep_string({ search = vim.fn.input('Grep > ') })
end)

require('telescope').load_extension('fzf')
