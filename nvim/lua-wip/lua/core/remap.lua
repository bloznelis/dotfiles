vim.g.mapleader = " "
vim.keymap.set("n", "<leader>o-", vim.cmd.Ex)
vim.keymap.set("n", "<leader>fs", vim.cmd.write)
vim.keymap.set("n", "<leader>wc", vim.cmd.q)

vim.keymap.set("v", "gp", [["_dP]]) -- god sent

-- buffers
vim.keymap.set("n", "<leader>bp", vim.cmd.bp)
vim.keymap.set("n", "<leader>bn", vim.cmd.bn)
vim.keymap.set("n", "<leader>bd", vim.cmd.bd)

-- move selected regions
vim.keymap.set("v", "<C-k>", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "<C-j>", ":m '>+1<CR>gv=gv")

-- misc
vim.keymap.set("n", "J", "mzJ`z") -- same as default J, but cursor stays in place

-- keep cursor in the middle of the screen
vim.keymap.set("n", "<C-d>", "<C-d>zz") -- while scrolling down
vim.keymap.set("n", "<C-u>", "<C-u>zz") -- while scrolling up
vim.keymap.set("n", "N", "Nzzzv") -- while searching up
vim.keymap.set("n", "n", "nzzzv") -- while searching down

-- copy to system clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])

-- format
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- replace word under cursor "dialog"
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- open init.lua
vim.keymap.set("n", "<leader>ec", function ()
   vim.cmd('e' .. "$HOME/.config/nvim/init.lua")
end)
