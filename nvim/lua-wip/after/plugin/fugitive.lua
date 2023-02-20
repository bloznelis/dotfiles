vim.keymap.set("n", "<leader>gs", vim.cmd.Git)

local lukas_fugitive = vim.api.nvim_create_augroup("lukas_fugitive", {})

local autocmd = vim.api.nvim_create_autocmd
autocmd("BufWinEnter", {
    group = lukas_fugitive,
    pattern = "*",
    callback = function()
        if vim.bo.ft ~= "fugitive" then
            return
        end

        local bufnr = vim.api.nvim_get_current_buf()
        local opts = {buffer = bufnr, remap = false}
        vim.keymap.set("n", "pp", function()
            vim.cmd.Git('push')
        end, opts)

        vim.keymap.set("n", "P", function()
            vim.cmd.Git({'pull',  '--rebase'})
        end, opts)
    end,
})
