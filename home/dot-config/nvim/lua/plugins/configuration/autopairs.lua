return {
  "windwp/nvim-autopairs",
  enabled = true,
  config = function()
    require("nvim-autopairs").setup({
      enable_check_bracket_line = true,
    })
  end
}
