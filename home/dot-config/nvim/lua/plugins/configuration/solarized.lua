return {
  "maxmx03/solarized.nvim",
  enabled = true,
  config = function()
    require('solarized').setup({
      styles = {
        comments = { italic = true, bold = false },
        functions = { italic = false },
        variables = { italic = false },
      },
      on_colors = function(colors, color)
        local darken = color.darken

        return {
          bg_dim = darken(colors.base3, 3),
          bg_dimer = darken(colors.base3, 5)
        }
      end,
      on_highlights = function(colors, color)
        return {
          SpellBad = { strikethrough = false },
          TelescopePromptNormal = { bg = colors.bg_dim },
          TelescopePromptBorder = { fg = colors.bg_dim, bg = colors.bg_dim },
          TelescopeResultsNormal = { fg = colors.base00, bg = colors.bg_dim },
          TelescopeResultsBorder = { fg = colors.bg_dim, bg = colors.bg_dim },
          TelescopePreviewNormal = { bg = colors.bg_dimer },
          TelescopePreviewBorder = { bg = colors.bg_dimer, fg = colors.bg_dimer },
        }
      end
    })
    vim.o.background = 'light'
    vim.cmd.colorscheme 'solarized'
  end
}
