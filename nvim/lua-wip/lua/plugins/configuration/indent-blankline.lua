return {
  "lukas-reineke/indent-blankline.nvim",
  event = "VeryLazy",
  config = function()
    require("indent_blankline").setup {
      indent_blankline_use_treesitter = true,
      --indent_blankline_show_first_indent_level = false,
      show_current_context = true,
    }
  end
}
