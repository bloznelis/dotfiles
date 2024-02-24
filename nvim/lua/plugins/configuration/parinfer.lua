return {
  "gpanders/nvim-parinfer",
  ft = { "clojure" },
  config = function()
    vim.g.parinfer_force_balance = true
  end
}
