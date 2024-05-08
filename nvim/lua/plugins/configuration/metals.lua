return {
  "scalameta/nvim-metals",
  ft = { "scala", "sbt", "java" },
  config = function()
    local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
    local metals_config = require("metals").bare_config()

    metals_config.on_attach = function(client, bufnr)
      vim.keymap.set("v", "K", require('metals').type_of_range)
    end

    vim.api.nvim_create_autocmd("FileType", {
      pattern = { "scala", "sbt", "java" },
      callback = function()
        metals_config.settings = {
          showImplicitArguments = true,
          showInferredType = true
        }

        metals_config.init_options.statusBarProvider = "off"
        metals_config.capabilities = require("cmp_nvim_lsp").default_capabilities()
        require("metals").initialize_or_attach(metals_config)
      end,
      group = nvim_metals_group,
    })
  end
}
