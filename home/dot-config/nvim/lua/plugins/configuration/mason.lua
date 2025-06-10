return {
    "williamboman/mason.nvim",
    enabled = false,
    event = "VeryLazy",
    config = function()
      require("mason").setup()
    end
}
