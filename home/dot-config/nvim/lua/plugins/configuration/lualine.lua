return {
  "nvim-lualine/lualine.nvim",
  event = "UiEnter",
  dependencies = {
    'arkav/lualine-lsp-progress',
    'nvim-tree/nvim-web-devicons'
  },
  config = function()
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
        lualine_c = { { 'filename', path = 1 } },
        lualine_x = { 'location', 'diagnostics', 'branch', 'diff', 'filetype', 'lsp_progress' },
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
