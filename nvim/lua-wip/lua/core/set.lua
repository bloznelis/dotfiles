vim.opt.guicursor = ""

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.wrap = false

vim.opt.clipboard = "unnamedplus" -- Use system clipboard

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes" -- A gutter for signs

vim.opt.updatetime = 250

vim.api.nvim_create_autocmd(
    "BufEnter",
    { command = "silent! lcd %:p:h" }
)
