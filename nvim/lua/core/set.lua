vim.opt.showmode = false -- Don't show mode in cmdline

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.wrap = true

vim.opt.clipboard = "unnamedplus" -- Use system clipboard

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes" -- A gutter for signs

vim.opt.updatetime = 250

-- change the working dir to the current file's dir
vim.api.nvim_create_autocmd(
  "BufEnter",
  { command = "silent! lcd %:p:h" }
)

-- trims trailing whiteline
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = { "*" },
  command = [[%s/\s\+$//e]],
})

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" },
  {
    pattern = { "*.yaml.gotmpl" },
    command = "set ft=yaml"
  }
)

vim.opt.spelllang = 'en_us'
vim.opt.spell = true
