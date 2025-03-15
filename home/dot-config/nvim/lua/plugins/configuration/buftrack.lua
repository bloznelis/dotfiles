return {
  'bloznelis/buftrack.nvim',
  config = function()
    local buftrack = require('buftrack')
    buftrack.setup()

    vim.api.nvim_create_autocmd({ "InsertEnter" }, {
      callback = buftrack.track_buffer
    })

    vim.keymap.set("n", "<C-j>", buftrack.prev_buffer)
    vim.keymap.set("n", "<C-k>", buftrack.next_buffer)
  end
}
