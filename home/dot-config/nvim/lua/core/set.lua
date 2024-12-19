vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.opt.showmode = false -- Don't show mode in cmdline

-- Hide cmdline when not in use
vim.opt.cmdheight = 0

-- highlight cursorline
vim.opt.cursorline = true

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.smartindent = false
vim.opt.autoindent = false
vim.opt.breakindent = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Case-insensitive searching UNLESS \C or capital in search
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.wrap = true

vim.opt.clipboard = "unnamedplus" -- Use system clipboard

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes" -- A gutter for signs

vim.opt.updatetime = 250

-- change the working dir to the current file's dir
-- vim.api.nvim_create_autocmd(
--   "BufEnter",
--   { command = "silent! lcd %:p:h" }
-- )

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

-- Highlight when yanking
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking',
  group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.opt.spelllang = 'en_us'
vim.opt.spell = true

vim.api.nvim_create_autocmd('Filetype', {
  group = vim.api.nvim_create_augroup('setIndent', { clear = true }),
  pattern = { 'scala' },
  command = 'setlocal shiftwidth=4 tabstop=4'
})
