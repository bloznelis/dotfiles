vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.keymap.set("n", "<leader>o-", vim.cmd.Ex)
vim.keymap.set("n", "<leader>fs", vim.cmd.write)

vim.keymap.set("v", "gp", [["_dP]]) -- god sent

vim.keymap.set("n", "g;", "`.") -- go to last edit spot

-- buffers
vim.keymap.set("n", "<leader>bp", vim.cmd.bp)
vim.keymap.set("n", "<leader>bn", vim.cmd.bn)
vim.keymap.set("n", "<leader>bd", vim.cmd.bd)

-- move selected regions
vim.keymap.set("v", "<M-k>", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "<M-j>", ":m '>+1<CR>gv=gv")

-- misc
vim.keymap.set("n", "J", "mzJ`z") -- same as default J, but cursor stays in place

-- Leader based window handling
vim.keymap.set("n", "<leader>wh", "<C-w>h")
vim.keymap.set("n", "<leader>wj", "<C-w>j")
vim.keymap.set("n", "<leader>wk", "<C-w>k")
vim.keymap.set("n", "<leader>wl", "<C-w>l")
vim.keymap.set("n", "<leader>wv", "<C-w>v<C-w>l")
vim.keymap.set("n", "<leader>ws", "<C-w>s<C-w>j")

vim.keymap.set("n", "<leader>wc", vim.cmd.q)

-- Leader based tab handling
vim.keymap.set("n", "<leader>tn", vim.cmd.tabnext)
vim.keymap.set("n", "<leader>tp", vim.cmd.tabprev)
vim.keymap.set("n", "<leader>tc", vim.cmd.tabnew)
vim.keymap.set("n", "<leader>tx", vim.cmd.tabclose)

-- keep cursor in the middle of the screen
vim.keymap.set("n", "<C-d>", "<C-d>zz") -- while scrolling down
vim.keymap.set("n", "<C-u>", "<C-u>zz") -- while scrolling up
vim.keymap.set("n", "N", "Nzzzv") -- while searching up
vim.keymap.set("n", "n", "nzzzv") -- while searching down

-- copy to system clipboard
--vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])

-- format
vim.keymap.set("n", "<leader>ff", vim.lsp.buf.format)

-- replace word under cursor "dialog"
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("v", "<leader>s", [[:s/replace/me/gI<Left><Left><Left>]])

-- surround selection
vim.keymap.set("v", "<leader>(", "c()<Esc>P")
vim.keymap.set("v", "<leader>[", "c[]<Esc>P")

-- open init.lua
vim.keymap.set("n", "<leader>ec", function ()
   vim.cmd('e' .. "$HOME/.config/nvim/init.lua")
end)
