return {
  "nvim-telescope/telescope.nvim",
  tag = '0.1.3',
  keys = { "<leader><leader>", "<leader>bb", "<leader>pp", "<leader>/" },
  dependencies = {
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    { 'nvim-telescope/telescope-project.nvim' },
  },
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
          },
        }
      }
    })


    local themes = require('telescope.themes')
    local is_inside_work_tree = {}

    vim.keymap.set('n', '<leader>bb', function()
      builtin.buffers(themes.get_dropdown({ sort_lastused = true }))
    end, {})

    vim.keymap.set('n', '<leader><leader>', function()
      local cwd = vim.fn.getcwd()
      if is_inside_work_tree[cwd] == nil then
        vim.fn.system("git rev-parse --is-inside-work-tree")
        is_inside_work_tree[cwd] = vim.v.shell_error == 0
      end

      if is_inside_work_tree[cwd] then
        builtin.git_files(themes.get_dropdown({ show_untracked = true }))
      else
        builtin.find_files(themes.get_dropdown())
      end
    end)

    vim.keymap.set('n', '<leader>/', function()
      local git_dir = vim.fn.system(string.format("git -C %s rev-parse --show-toplevel", vim.fn.expand("%:p:h")))
      git_dir = string.gsub(git_dir, "\n", "") -- remove newline character from git_dir
      local opts = {
        cwd = git_dir,
      }
      require('telescope.builtin').live_grep(themes.get_dropdown(opts))
    end)

    vim.keymap.set('n', '<leader>pp', function()
      require('telescope').extensions.project.project {}
    end)

    vim.keymap.set('n', '<leader><CR>', function()
      require('telescope.builtin').resume(themes.get_dropdown())
    end)


    require('telescope').load_extension('fzf')
    require('telescope').load_extension('project')
  end
}
