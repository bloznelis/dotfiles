return {
  'notjedi/nvim-rooter.lua',
  enabled = true,
  config = function()
    require('nvim-rooter').setup {
      rooter_patterns = { '.root' }
    }
  end
}
