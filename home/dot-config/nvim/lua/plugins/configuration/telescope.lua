return {
  "nvim-telescope/telescope.nvim",
  keys = { "<leader><leader>", "<leader>bb", "<leader>pp", "<leader>/", "<leader>" },
  dependencies = {
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    { 'nvim-telescope/telescope-project.nvim' },
    { 'nvim-telescope/telescope-ui-select.nvim' }
  },
  config = function()
    local builtin = require('telescope.builtin')
    local actions = require('telescope.actions')

    require('telescope').setup({
      defaults = {
        vimgrep_arguments = {
          "rg",
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
          "--smart-case",
          "--fixed-strings"
        },
        path_display = { "smart" },
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
        ["ui-select"] = {
          require("telescope.themes").get_ivy {},
        },
        project = {
          base_dirs = {
            '~/code',
            '~/work',
          },
        },
        fzf = {
          case_mode = "smart_case", -- "smart_case", "ignore_case" or "respect_case"
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

    vim.keymap.set('n', '<leader>/', function()
      require('telescope.builtin').live_grep()
    end)

    vim.keymap.set('v', '<leader>/', function()
      require('telescope.builtin').live_grep()
    end)

    vim.keymap.set('n', '<leader>pp', function()
      require 'telescope'.extensions.projects.projects {}
    end)

    vim.keymap.set('n', '<leader><CR>', function()
      require('telescope.builtin').resume()
    end)

    vim.keymap.set("n", "<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols)

    require('telescope').load_extension('fzf')
    require('telescope').load_extension('projects')
    require("telescope").load_extension("ui-select")
  end
}
