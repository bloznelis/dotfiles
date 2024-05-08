return {
  "maxmx03/solarized.nvim",
  config = function()
    require('solarized').setup({
      styles = {
        comments = { italic = true, bold = false },
        functions = { italic = false },
        variables = { italic = false },
      }
    })
    vim.o.background = 'light'
    vim.cmd.colorscheme 'solarized'
  end
}
