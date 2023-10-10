return {
  'echasnovski/mini.files',
  version = false,
  keys = {
    { "<leader>oP", "<cmd> lua MiniFiles.open()<CR>", desc = "Mini files open" },
    { "<leader>op", "<cmd> lua MiniFiles.open(vim.api.nvim_buf_get_name(0))<CR>", desc = "Mini files open find file" },
  },
  config = function()
    require('mini.files').setup({
      mappings = {
        go_in_plus = '<CR>',
      },
    })
  end
}
