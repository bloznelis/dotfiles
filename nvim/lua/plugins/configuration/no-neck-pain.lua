return {
  "shortcuts/no-neck-pain.nvim",
  -- keys = { "<leader>nn" },
  version = "*",
  opts = {
    width = 130,
    fallbackOnBufferDelete = true,
    skipEnteringNoNeckPainBuffer = false,
    mappings = {
      enabled = true,
      toggle = "<leader>nn",
    },
    buffers = {
      scratchPad = {
        enabled = true
      },
      bo = {
        filetype = "md"
      }
    }
  }
}
