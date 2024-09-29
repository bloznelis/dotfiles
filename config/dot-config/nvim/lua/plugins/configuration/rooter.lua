return {
  'notjedi/nvim-rooter.lua',
  enabled = false,
  config = function()
    require('nvim-rooter').setup {
      rooter_patterns = { '.root' },
      trigger_patterns = { '*scala' },
      exclude_filetypes = { 'NeogitStatus', 'Neogit*' },
      fallback_to_parent = true,
    }
  end
}
