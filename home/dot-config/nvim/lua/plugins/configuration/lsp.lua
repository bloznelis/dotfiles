return {
  "neovim/nvim-lspconfig",
  ft = { "clojure", "rust", "lua", "go", "ocaml", "python", "scala", "java", "sbt" },
  config = function()
    local lspconfig = require('lspconfig')
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    -- capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

    local signs = {
      Error = " ",
      Warn = "⚠ ",
      Hint = "⊕ ",
      Info = " "
    }

    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
    end

    vim.api.nvim_create_autocmd('LspAttach', {
      desc = 'LSP actions',
      callback = function(event)
        local opts = { buffer = event.buf, remap = true }

        vim.keymap.set("n", "gr", function() vim.lsp.buf.references() end, opts)
        vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
        vim.keymap.set("n", "gD", function() vim.lsp.buf.references() end, opts)
        vim.keymap.set("n", "gi", function() vim.lsp.buf.implementation() end, opts)
        vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
        vim.keymap.set("n", "<leader>cd", function() vim.diagnostic.open_float() end, opts)
        vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, opts)
        vim.keymap.set("n", "ge", function()
          vim.diagnostic.jump({ count = 1, severity = vim.diagnostic.severity.ERROR })
        end, opts)
        vim.keymap.set("n", "gE", function()
          vim.diagnostic.jump({ count = -1, severity = vim.diagnostic.severity.ERROR })
        end, opts)
        vim.keymap.set("n", "gw", function()
          vim.diagnostic.jump({ count = 1, severity = vim.diagnostic.severity.WARN })
        end, opts)
        vim.keymap.set("n", "gW", function()
          vim.diagnostic.jump({ count = -1, severity = vim.diagnostic.severity.WARN })
        end, opts)
        vim.keymap.set("n", "<leader>cr", function() vim.lsp.buf.rename() end, opts)
        vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)

        vim.keymap.set("n", "<leader>aa", vim.diagnostic.setqflist)
        vim.keymap.set("n", "<leader>ae", function()
          vim.diagnostic.setqflist({ severity = vim.diagnostic.severity.ERROR })
        end)
        vim.keymap.set("n", "<leader>aw", function()
          vim.diagnostic.setqflist({ severity = vim.diagnostic.severity.WARN })
        end)
      end
    })

    -- #### Server specific configuration ####
    -- ### Lua ###
    lspconfig.lua_ls.setup({
      capabilities = capabilities,
      settings = {
        Lua = {
          runtime = {
            version = 'LuaJIT'
          },
          diagnostics = {
            globals = { 'vim' },
          },
          workspace = {
            library = {
              vim.env.VIMRUNTIME,
            }
          }
        }
      }
    })

    -- ### Python ###
    lspconfig.pyright.setup({
      capabilities = capabilities,
    })

    -- ### OCaml ###
    lspconfig.ocamllsp.setup({
      capabilities = capabilities,
    })

    -- ### Go ###
    lspconfig.gopls.setup({
      capabilities = capabilities,
    })

    -- ### Clojure ###
    lspconfig.clojure_lsp.setup({
      capabilities = capabilities,
    })

    -- ### Rust ###
    lspconfig.rust_analyzer.setup({
      capabilities = capabilities,
    })
  end
}
