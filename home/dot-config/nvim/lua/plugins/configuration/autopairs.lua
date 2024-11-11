return {
  "windwp/nvim-autopairs",
  enabled = false,
  config = function()
    require("nvim-autopairs").setup({
      enable_check_bracket_line = true,
    })
  end
}
