return {
  "nvim-lualine/lualine.nvim",
  event = "UiEnter",
  dependencies = {
    'linrongbin16/lsp-progress.nvim',
    'nvim-tree/nvim-web-devicons'
  },
  config = function()
    require('lsp-progress').setup()
    require('lualine').setup {
      options = {
        icons_enabled = true,
        component_separators = '|',
        section_separators = '',
        disabled_filetypes = {
          statusline = {},
          winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = false,
      },
      sections = {
        lualine_a = { 'mode' },
        lualine_b = {},
        lualine_c = { function()
            local cwd = vim.fn.getcwd(0)  -- or vim.loop.cwd()
            return vim.fn.fnamemodify(cwd, ":t")
        end },
        lualine_x = {
          function() return require('lsp-progress').progress() end,
          'location',
          'diagnostics',
          'branch',
          'diff',
          'filetype',
        },
        lualine_y = {},
        lualine_z = {}
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { },
        lualine_x = {},
        lualine_y = {},
        lualine_z = {}
      },
      tabline = {},
      winbar = {
        lualine_a = {},
        lualine_b = { },
        lualine_c = { { 'filename', path = 0 } },
        lualine_x = {},
        lualine_y = {},
        lualine_z = {}
      },
      inactive_winbar = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { { 'filename', path = 0 } },
        lualine_x = {},
        lualine_y = {},
        lualine_z = {}
      },
      extensions = {}
    }

    -- listen lsp-progress event and refresh lualine
    vim.api.nvim_create_augroup("lualine_augroup", { clear = true })
    vim.api.nvim_create_autocmd("User", {
      group = "lualine_augroup",
      pattern = "LspProgressStatusUpdated",
      callback = require("lualine").refresh,
    })
  end
}
