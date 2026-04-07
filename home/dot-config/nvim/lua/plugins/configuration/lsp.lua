return {
  "neovim/nvim-lspconfig",
  ft = {
        "clojure",
        "go",
        "java",
        "lua",
        "ocaml",
        "openscad",
        "python",
        "rust",
        "sbt",
        "scala",
        "zig"
      },
  config = function()
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    -- capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

    vim.diagnostic.config({
      virtual_text = true,
      update_in_insert = true,
      float = float_config,
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = "",
          [vim.diagnostic.severity.WARN] = "",
          [vim.diagnostic.severity.HINT] = "󰌶",
          [vim.diagnostic.severity.INFO] = "",
        },
      },
    })

    vim.api.nvim_create_autocmd('LspAttach', {
      desc = 'LSP actions',
      callback = function(event)
        local opts = { buffer = event.buf, remap = true }

        vim.keymap.set("n", "gr", function() vim.lsp.buf.references() end, opts)
        vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
        vim.keymap.set("n", "gD", function() vim.lsp.buf.declaration() end, opts)
        vim.keymap.set("n", "gi", function() vim.lsp.buf.implementation() end, opts)
        vim.keymap.set("n", "gt", function() vim.lsp.buf.type_definition() end, opts)
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

    local servers = {
      zls = {},
      gopls = {},
      ocamllsp = {},
      pyright = {},
      clojure_lsp = {},
      rust_analyzer = {},
      openscad_lsp = {},
      harper_ls = {
        settings = {
          userDictPath = vim.fn.stdpath("config") .. "/spell/en.utf-8.add",
        }
      },
      lua_ls = {
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
                "${3rd}/love2d/library"
              }
            }
          }
        }
      }
    }

    for server, settings in pairs(servers) do
      vim.lsp.config(server, settings)
      vim.lsp.enable(server)
    end
  end
}
