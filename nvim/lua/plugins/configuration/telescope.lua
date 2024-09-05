return {
  "nvim-telescope/telescope.nvim",
  tag = '0.1.8',
  keys = { "<leader><leader>", "<leader>bb", "<leader>pp", "<leader>/", "<leader>" },
  dependencies = {
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    { 'nvim-telescope/telescope-project.nvim' },
  },
  config = function()
    local builtin = require('telescope.builtin')
    local actions = require('telescope.actions')
    local project_actions = require("telescope._extensions.project.actions")

    require('telescope').setup({
      defaults = {
        path_display = { "truncate" },
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
      extensions = {
        project = {
          base_dirs = {
            '~/work',
            '~/code',
          },
          -- on_project_selected = function(prompt_bufnr)
          --   project_actions.change_working_directory(prompt_bufnr, false)
          -- end
        }
      }
    })


    local themes = require('telescope.themes')


    vim.keymap.set('n', '<leader>cc', function()
      builtin.commands({ sort_lastused = true })
    end, {})

    vim.keymap.set('n', '<leader>bb', function()
      builtin.buffers(themes.get_dropdown({ sort_lastused = true }))
    end, {})

    vim.keymap.set('n', '<leader>.', function()
      builtin.git_files({ show_untracked = true, previewer = true })
    end)

    vim.keymap.set('n', '<leader><leader>', function()
      builtin.find_files()
    end)

    -- vim.keymap.set('n', '<leader>.', function()
    --   local lsp_root = vim.lsp.buf.list_workspace_folders()
    --   -- builtin.find_files({ cwd = lsp_root[1] })
    --   builtin.find_files()
    -- end)

    vim.keymap.set('n', '<leader>/', function()
      -- require('telescope.builtin').live_grep(themes.get_dropdown({ previewer = true }))
      require('telescope.builtin').live_grep()
    end)

    vim.keymap.set('v', '<leader>/', function()
      -- require('telescope.builtin').grep_string(themes.get_dropdown({ previewer = true }))
      require('telescope.builtin').live_grep()
    end)

    vim.keymap.set('n', '<leader>pp', function()
      require('telescope').extensions.project.project {}
    end)

    vim.keymap.set('n', '<leader><CR>', function()
      -- require('telescope.builtin').resume(themes.get_dropdown({ previewer = true }))
      require('telescope.builtin').resume()
    end)

    vim.keymap.set("n", "<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols)

    require('telescope').load_extension('fzf')
    require('telescope').load_extension('project')
  end
}
