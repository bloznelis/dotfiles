return {
  'notjedi/nvim-rooter.lua',
  enabled = true,
  config = function()
    require('nvim-rooter').setup {
      rooter_patterns = { '.root' },
      trigger_patterns = { '*scala' },
      exclude_filetypes = { 'NeogitStatus' }
      -- fallback_to_parent = true,
    }
  end
}
