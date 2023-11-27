-- https://github.com/echasnovski/mini.surround
return {
  "echasnovski/mini.nvim",
  -- keys = { "sa" } TODO: needs to be in visual mode,
  config = function()
    require('mini.surround').setup()
  end
}
