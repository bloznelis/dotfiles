return {
  "nvim-telescope/telescope.nvim",
  keys = { "<leader><leader>", "<leader>bb", "<leader>pp", "<leader>/"},
  config = function()
    local builtin = require('telescope.builtin')
    local actions = require('telescope.actions')

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
      extensions = {
        project = {
          base_dirs = {
            '~/work',
            '~/code',
            --{ path = '~/dev/src5', max_depth = 2 },
          },
          --hidden_files = true, -- default: false
          --on_project_selected = function(prompt_bufnr)
          --project_actions.change_working_directory(prompt_bufnr, false)
          --end
        }
      }
    })

    --require'telescope'.extensions.project.project{}
    --require'telescope'.load_extension('project')

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
    vim.keymap.set('n', '<leader>pp', function()
      require('telescope').extensions.project.project {}
    end)

    require('telescope').load_extension('fzf')
    require('telescope').load_extension('project')
  end
}