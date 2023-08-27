return {
  'echasnovski/mini.files',
  version = false,
  keys = {
    { "<leader>op", "<cmd> lua MiniFiles.open()<CR>", desc = "Mini files open" },
  },
  config = function()
    require('mini.files').setup({
      mappings = {
        go_in_plus = '<CR>',
      },
    })
  end
}
