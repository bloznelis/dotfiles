local map = vim.keymap.set
local fn = vim.fn

return {
  "scalameta/nvim-metals",
  ft = { "scala", "java", "sbt" },
  opts = function()
    local metals_config = require("metals").bare_config()
    local telescope = require('telescope.builtin')

    -- Example of settings
    metals_config.settings = {
      showImplicitArguments = true,
      excludedPackages = { "akka.actor.typed.javadsl", "com.github.swagger.akka.javadsl" },
    }

    -- *READ THIS*
    -- I *highly* recommend setting statusBarProvider to true, however if you do,
    -- you *have* to have a setting to display this in your statusline or else
    -- you'll not see any messages from metals. There is more info in the help
    -- docs about this
    -- metals_config.init_options.statusBarProvider = "on"

    -- Example if you are using cmp how to make sure the correct capabilities for snippets are set
    metals_config.capabilities = require("cmp_nvim_lsp").default_capabilities()

    metals_config.on_attach = function(client, bufnr)
      map("n", "gd", function() vim.lsp.buf.definition() end)
      map("n", "gD", function()
          telescope.lsp_references(require('telescope.themes').get_dropdown({}))
        end
      )
      map("n", "gi", function() vim.lsp.buf.implementation() end)
      map("n", "K", function() vim.lsp.buf.hover() end)
      map("v", "K", require('metals').type_of_range)
      map("n", "<leader>cd", function() vim.diagnostic.open_float() end)
      map("n", "<leader>c[", function() vim.diagnostic.goto_next() end)
      map("n", "<leader>c]", function() vim.diagnostic.goto_prev() end)
      map("n", "<leader>ca", function() vim.lsp.buf.code_action() end)
      map("n", "ge", function()
        vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.ERROR })
      end)
      map("n", "gE", function()
        vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.ERROR })
      end)
      map("n", "gw", function()
        vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.WARN })
      end)
      map("n", "gW", function()
        vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.WARN })
      end)
      map("n", "<leader>cr", function() vim.lsp.buf.rename() end)
      map("i", "<C-h>", function() vim.lsp.buf.signature_help() end)
      -- LSP mappings
      -- map("n", "gD", vim.lsp.buf.definition)
      -- map("n", "K", vim.lsp.buf.hover)
      -- map("v", "K", require('metals').type_of_range)
      -- map("n", "gi", vim.lsp.buf.implementation)
      -- map("n", "gr", vim.lsp.buf.references)
      -- map("n", "gds", vim.lsp.buf.document_symbol)
      -- map("n", "gws", vim.lsp.buf.workspace_symbol)
      -- map("n", "<leader>cl", vim.lsp.codelens.run)
      -- map("n", "<leader>sh", vim.lsp.buf.signature_help)
      -- map("n", "<leader>rn", vim.lsp.buf.rename)
      -- map("n", "<leader>f", vim.lsp.buf.format)
      -- map("n", "<leader>ca", vim.lsp.buf.code_action)

      -- all workspace diagnostics
      map("n", "<leader>aa", vim.diagnostic.setqflist)

      -- all workspace errors
      map("n", "<leader>ae", function()
        vim.diagnostic.setqflist({ severity = "E" })
      end)

      -- all workspace warnings
      map("n", "<leader>aw", function()
        vim.diagnostic.setqflist({ severity = "W" })
      end)

      -- buffer diagnostics only
      map("n", "<leader>d", vim.diagnostic.setloclist)
    end

    return metals_config
  end,
  config = function(self, metals_config)
    require("metals").initialize_or_attach(metals_config)
  end

}
-- config = function()
--   local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
--   local metals_config = require("metals").bare_config()
--
--   metals_config.init_options.statusBarProvider = "on"
--   metals_config.capabilities = require("cmp_nvim_lsp").default_capabilities()
--
--   vim.api.nvim_create_autocmd("FileType", {
--     pattern = { "scala", "sbt", "java" },
--     callback = function()
--       vim.keymap.set("v", "K", require('metals').type_of_range)
--       require("metals").initialize_or_attach(metals_config)
--     end,
--     group = nvim_metals_group,
--   })
-- end
