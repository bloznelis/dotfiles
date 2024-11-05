-- https://github.com/echasnovski/mini.surround
return {
  enabled = false,
  "echasnovski/mini.nvim",
  config = function()
    require('mini.surround').setup()
  end
}
