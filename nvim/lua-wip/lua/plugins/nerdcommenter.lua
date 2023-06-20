return {
  "preservim/nerdcommenter",
  config = function()
    local api = vim.api

    api.nvim_set_var("NERDSpaceDelims", 0)

    -- why this does not work !
    api.nvim_set_var("NERDCreateDefaultMappings", 0)
    vim.g.NERDCreateDefaultMappings = 0

    api.nvim_set_keymap("n", "<C-_>", ':call nerdcommenter#Comment(0, "toggle")<CR><CR>', { noremap = true })
    api.nvim_set_keymap("v", "<C-_>", ':call nerdcommenter#Comment(0, "toggle")<CR><CR>', { noremap = true })
  end
}
