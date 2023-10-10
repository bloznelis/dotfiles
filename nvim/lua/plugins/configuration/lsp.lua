return {
  "VonHeikemen/lsp-zero.nvim",
  event = "VeryLazy",
  -- ft = {"lua", "rust", "go", "scala", "clojure", "python"},
  config = function()
    local lsp = require('lsp-zero').preset({
      name = 'minimal',
      set_lsp_keymaps = true,
      manage_nvim_cmp = true,
    })

    lsp.setup_servers({'ocamllsp', 'terraform_lsp', 'elmls', 'metals', 'rust_analyzer', 'lua_ls', 'gopls', 'clojure_lsp', 'pyright' })

    -- require('mason').setup()
    -- require('mason-lspconfig').setup()

    require 'lspconfig'.lua_ls.setup {
      settings = {
        Lua = {
          diagnostics = {
            globals = { 'vim' }
          }
        },
      }
    }

    -- require 'lspconfig'.rust_analyzer.setup {
    --   settings = {
    --     ["rust-analyzer"] = {
    --       diagnostics = {
    --         enable = true,
    --         disabled = { "unresolved-proc-macro" },
    --         enableExperimental = true,
    --         checkOnSave = {
    --           command = "clippy",
    --         },
    --       },
    --     }
    --   }
    -- }

    local cmp = require('cmp')
    local luasnip = require 'luasnip'

    luasnip.config.setup {}

    --local cmp_select = {behavior = cmp.SelectBehavior.Select}
    local cmp_mappings = cmp.mapping.preset.insert {
      ['<C-n>'] = cmp.mapping.select_next_item(),
      ['<C-p>'] = cmp.mapping.select_prev_item(),
      ['<C-d>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete {},
      ['<CR>'] = cmp.mapping.confirm {
        behavior = cmp.ConfirmBehavior.Insert,
        select = true,
      },
      ['<Tab>'] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        elseif luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump()
        else
          fallback()
        end
      end, { 'i', 's' }),
      ['<S-Tab>'] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        elseif luasnip.jumpable(-1) then
          luasnip.jump(-1)
        else
          fallback()
        end
      end, { 'i', 's' }),
    }


    lsp.setup_nvim_cmp({ mapping = cmp_mappings })

    -- (Optional) Configure lua language server for neovim
    lsp.nvim_workspace()

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

    lsp.on_attach(function(client, bufnr)
      local opts = { buffer = bufnr, remap = false }
      local telescope = require('telescope.builtin')

      -- metals specific
      vim.keymap.set("v", "K", require("metals").type_of_range)

      vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
      vim.keymap.set("n", "gD", function()
          telescope.lsp_references(require('telescope.themes').get_dropdown({}))
        end,
        opts
      )
      vim.keymap.set("n", "gi", function() vim.lsp.buf.implementation() end, opts)
      vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
      vim.keymap.set("n", "<leader>ch", function() vim.lsp.buf.signature_help() end, opts)
      vim.keymap.set("n", "<leader>cd", function() vim.diagnostic.open_float() end, opts)
      vim.keymap.set("n", "<leader>c[", function() vim.diagnostic.goto_next() end, opts)
      vim.keymap.set("n", "<leader>c]", function() vim.diagnostic.goto_prev() end, opts)
      vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, opts)
      vim.keymap.set("n", "ge", function()
        vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.ERROR })
      end, opts)
      vim.keymap.set("n", "gE", function()
        vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.ERROR })
      end, opts)
      vim.keymap.set("n", "<leader>cr", function() vim.lsp.buf.rename() end, opts)
      vim.keymap.set("i", "<C-p>", function() vim.lsp.buf.signature_help() end, opts)
    end)

    lsp.setup()

    vim.diagnostic.config({
      virtual_text = true,
      float = {
        focusable = false,
        style = 'minimal',
        source = 'always',
        header = '',
        prefix = '',
      },
    })
  end
}
