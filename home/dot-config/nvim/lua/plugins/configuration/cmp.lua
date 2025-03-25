return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  enabled = false,
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-nvim-lua",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "L3MON4D3/LuaSnip",
    "rafamadriz/friendly-snippets",
    "saadparwaiz1/cmp_luasnip"
  },
  config = function()
    local cmp = require('cmp')

    -- load in some snippets
    require("luasnip.loaders.from_vscode").lazy_load()
    require("luasnip.loaders.from_lua").load({ paths = "./snippets" })
    local luasnip = require('luasnip')

    -- https://github.com/hrsh7th/nvim-cmp/issues/156#issuecomment-916338617
    local lspkind_comparator = function(conf)
      local lsp_types = require('cmp.types').lsp
      return function(entry1, entry2)
        if entry1.source.name ~= 'nvim_lsp' then
          if entry2.source.name == 'nvim_lsp' then
            return false
          else
            return nil
          end
        end
        local kind1 = lsp_types.CompletionItemKind[entry1:get_kind()]
        local kind2 = lsp_types.CompletionItemKind[entry2:get_kind()]

        local priority1 = conf.kind_priority[kind1] or 0
        local priority2 = conf.kind_priority[kind2] or 0
        if priority1 == priority2 then
          return nil
        end
        return priority2 < priority1
      end
    end

    local label_comparator = function(entry1, entry2)
      return entry1.completion_item.label < entry2.completion_item.label
    end

    cmp.setup({
      sources = {
        { name = 'nvim_lsp' },
        { name = 'nvim_lua' },
        { name = 'luasnip' },
        { name = 'buffer' },
        { name = 'path' },
      },
      completion = {
        completeopt = 'menu,menuone,noinsert'
      },
      preselect = cmp.PreselectMode.None,
      mapping = cmp.mapping.preset.insert({
        ['<C-d>'] = function()
          if cmp.visible_docs() then
            cmp.close_docs()
          else
            cmp.open_docs()
          end
        end,

        ['<C-J>'] = cmp.mapping(function()
          luasnip.jump(1)
        end, { "i", "s" }),

        ['<C-K>'] = cmp.mapping(function()
          luasnip.jump(-1)
        end, { "i", "s" }),

        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          else
            fallback()
          end
        end, { "i", "s" }),

        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          else
            fallback()
          end
        end, { "i", "s" }),

        ['<C-Space>'] = cmp.mapping(function()
          if cmp.visible() then
            cmp.close()
          else
            cmp.complete()
          end
        end, { 'i', 's' }),
        ['<CR>'] = cmp.mapping.confirm({ select = true, behavior = cmp.ConfirmBehavior.Insert }),
        ['<C-c>'] = cmp.mapping.close(),
      }),
      snippet = {
        expand = function(args)
          require('luasnip').lsp_expand(args.body)
        end,
      },
      sorting = {
        comparators = {
          lspkind_comparator({
            kind_priority = {
              Module = 30,
              Field = 20,
              Function = 16,
              Enum = 15,
              EnumMember = 15,
              Method = 14,
              Property = 12,
              Constant = 11,
              Event = 10,
              Operator = 10,
              Reference = 10,
              Struct = 10,
              Variable = 9,
              File = 8,
              Folder = 8,
              Class = 5,
              Color = 5,
              Keyword = 3,
              Snippet = 2,
              Constructor = 1,
              Interface = 1,
              Text = 1,
              TypeParameter = 1,
              Unit = 1,
              Value = 1,
            },
          }),
          cmp.config.compare.offset,
          cmp.config.compare.length,
          cmp.config.compare.exact,
          cmp.config.compare.kind,
          cmp.config.compare.score,
          cmp.config.compare.recently_used,
          label_comparator
        },
      },
      formatting = {
        fields = { "abbr", "menu", "kind" },
        format = function(entry, vim_item)
          -- limit completion width
          local MAX_LABEL_WIDTH = 50
          local label = vim_item.abbr
          local truncated_label = vim.fn.strcharpart(label, 0, MAX_LABEL_WIDTH)
          if truncated_label ~= label then
            vim_item.abbr = truncated_label .. '…'
          end

          -- set a name for each source
          vim_item.menu = ({
            buffer = "[Buffer]",
            nvim_lsp = "[LSP]",
            luasnip = "[Snippet]",
            nvim_lua = "[Lua]",
          })[entry.source.name]

          return vim_item
        end,
      },
    })
  end
}
