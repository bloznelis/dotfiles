return {
  "EdenEast/nightfox.nvim",
  enabled = true,
  config = function()
    require('nightfox').setup({
      options = {
        styles = {
          comments = "italic",
          keywords = "bold",
        }
      }
    })
    vim.cmd("colorscheme dayfox")
  end
}
