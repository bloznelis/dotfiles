-- https://github.com/echasnovski/mini.surround
return {
  "echasnovski/mini.nvim",
  keys = { "sa" },
  config = function()
    require('mini.surround').setup()
  end
}
