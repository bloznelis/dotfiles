return {
  'stevearc/dressing.nvim',
  event = "UiEnter",
  setup = function()
    require("dressing").setup()
  end
}
