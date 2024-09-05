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

      on_highlights = function(colors, color)
        return {
          SpellBad = { strikethrough = false },
        }
      end


    })
    vim.o.background = 'light'
    vim.cmd.colorscheme 'solarized'
  end
}
