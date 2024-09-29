vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.keymap.set("n", "<leader>o-", vim.cmd.Ex)
vim.keymap.set("n", "<leader>fs", vim.cmd.write)

vim.keymap.set("v", "p", "P")
vim.keymap.set("v", "p", "P")

-- buffers
vim.keymap.set("n", "<C-j>", vim.cmd.bp)
vim.keymap.set("n", "<C-k>", vim.cmd.bn)
vim.keymap.set("n", "<S-x>", vim.cmd.bd)
vim.keymap.set("n", "<leader>bp", vim.cmd.bp)
vim.keymap.set("n", "<leader>bn", vim.cmd.bn)
vim.keymap.set("n", "<leader>bx", vim.cmd.bd)

-- move selected regions
vim.keymap.set("v", "<M-k>", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "<M-j>", ":m '>+1<CR>gv=gv")

-- misc
vim.keymap.set("n", "J", "mzJ`z") -- same as default J, but cursor stays in place

-- windows
vim.keymap.set("n", "<C-w>v", "<C-w>v<C-w>l")
vim.keymap.set("n", "<C-w>s", "<C-w>s<C-w>j")

-- tabs
vim.keymap.set("n", "<leader>tn", vim.cmd.tabnext)
vim.keymap.set("n", "<leader>tp", vim.cmd.tabprev)
vim.keymap.set("n", "<leader>tt", vim.cmd.tabnew)
vim.keymap.set("n", "<leader>tx", vim.cmd.tabclose)

-- keep cursor in the middle of the screen
vim.keymap.set("n", "<C-d>", "<C-d>zz") -- while scrolling down
vim.keymap.set("n", "<C-u>", "<C-u>zz") -- while scrolling up
vim.keymap.set("n", "N", "Nzzzv") -- while searching up
vim.keymap.set("n", "n", "nzzzv") -- while searching down

-- format
vim.keymap.set("n", "<leader>ff", vim.lsp.buf.format)

-- replace word under cursor "dialog"
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
-- replace all occurrences of the current selection
vim.keymap.set("v", "<leader>s", [["hy:%s/<C-r>h/<C-r>h/gc<left><left><left>]])

-- surround selection
vim.keymap.set("v", "<leader>(", "c()<Esc>P")
vim.keymap.set("v", "<leader>[", "c[]<Esc>P")

-- open init.lua
vim.keymap.set("n", "<leader>ec", function ()
    require('telescope.builtin').find_files({ cwd = "$HOME/.config/nvim" })
end)

-- comments
vim.keymap.set("n", "<C-_>", "gcc")

-- Don't include newline at the end of the line
vim.keymap.set("n", "<End>", "g_")

--quickfix
vim.keymap.set("n", "<C-n>", vim.cmd.cn)
vim.keymap.set("n", "<C-p>", vim.cmd.cp)
