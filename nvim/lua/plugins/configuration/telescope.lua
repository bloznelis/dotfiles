return {
  "nvim-telescope/telescope.nvim",
  keys = { "<leader><leader>", "<leader>bb", "<leader>pp", "<leader>/" },
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

    local is_inside_work_tree = {}
    vim.keymap.set('n', '<leader>bb', function() builtin.buffers(require('telescope.themes').get_dropdown({ sort_lastused = true })) end, {})
    vim.keymap.set('n', '<leader><leader>', function()
      local cwd = vim.fn.getcwd()
      if is_inside_work_tree[cwd] == nil then
        vim.fn.system("git rev-parse --is-inside-work-tree")
        is_inside_work_tree[cwd] = vim.v.shell_error == 0
      end

      if is_inside_work_tree[cwd] then
        builtin.git_files(require('telescope.themes').get_dropdown({ show_untracked = true }))
      else
        builtin.find_files(require('telescope.themes').get_dropdown())
      end


      -- if pcall(builtin.git_files(require('telescope.themes').get_dropdown({})), { show_untracked = true }) then
      --   builtin.git_files(require('telescope.themes').get_dropdown({}))
      -- else
      --   builtin.find_files(require('telescope.themes').get_dropdown({}))
      -- end
    end)
    vim.keymap.set('n', '<leader>/', function()
      local git_dir = vim.fn.system(string.format("git -C %s rev-parse --show-toplevel", vim.fn.expand("%:p:h")))
      git_dir = string.gsub(git_dir, "\n", "") -- remove newline character from git_dir
      local opts = {
        cwd = git_dir,
      }
      require('telescope.builtin').live_grep(require('telescope.themes').get_dropdown(opts))
      -- builtin.grep_string(require('telescope.themes').get_dropdown({ search = vim.fn.input('Grep > ') }))
    end)
    vim.keymap.set('n', '<leader>pp', function()
      require('telescope').extensions.project.project {}
    end)

    require('telescope').load_extension('fzf')
    require('telescope').load_extension('project')
  end
}
