return {
  "EdenEast/nightfox.nvim",
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
