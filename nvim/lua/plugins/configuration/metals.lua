return {
  "scalameta/nvim-metals",
  config = function()
    local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
    local metals_config = require("metals").bare_config()

    metals_config.init_options.statusBarProvider = "on"

    vim.api.nvim_create_autocmd("FileType", {
      pattern = { "scala", "sbt", "java" },
      callback = function()
        vim.keymap.set("v", "K", require('metals').type_of_range)
        require("metals").initialize_or_attach(metals_config)
      end,
      group = nvim_metals_group,
    })
  end
}
