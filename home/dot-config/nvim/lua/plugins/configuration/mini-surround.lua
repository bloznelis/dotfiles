-- https://github.com/echasnovski/mini.surround
return {
  enabled = false,
  "echasnovski/mini.nvim",
  config = function()
    require('mini.surround').setup( -- No need to copy this inside `setup()`. Will be used automatically.
      {
        -- Module mappings. Use `''` (empty string) to disable one.
        mappings = {
          add = 'sa',      -- Add surrounding in Normal and Visual modes
          delete = 'sd',   -- Delete surrounding
          find = 'sf',     -- Find surrounding (to the right)
          find_left = 'sF', -- Find surrounding (to the left)
          highlight = 'sh', -- Highlight surrounding
          replace = 'sr',  -- Replace surrounding
          update_n_lines = 'sn', -- Update `n_lines`

          suffix_last = 'l', -- Suffix to search with "prev" method
          suffix_next = 'n', -- Suffix to search with "next" method
        },
      })

    -- vim.keymap.set("v", "(", "sa)") -- while scrolling down
  end
}
