return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  dependencies = {
    "arkav/lualine-lsp-progress"
  },
  config = function()
    require('lualine').setup {
      options = {
        icons_enabled = true,
        theme = 'kanagawa',
        component_separators = '|',
        section_separators = '',
        disabled_filetypes = {
          statusline = {},
          winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = false,
        refresh = {
          statusline = 1000,
          tabline = 1000,
          winbar = 1000,
        }
      },
      sections = {
        lualine_a = { 'mode' },
        lualine_b = { },
        lualine_c = { { 'filename', path = 3 }},
        lualine_x = { 'location', 'diagnostics', 'branch', 'diff', 'filetype', 'lsp_progress'},
        lualine_y = {},
        lualine_z = {}
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { 'filename' },
        lualine_x = {},
        lualine_y = {},
        lualine_z = {}
      },
      tabline = {},
      winbar = {},
      inactive_winbar = {},
      extensions = {}
    }
  end
}
