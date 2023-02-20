vim.keymap.set("n", "<leader>zz", function()
    require("zen-mode").setup {
        window = {
            width = 100,
            options = { }
        },
        plugins = {
            alacritty = {
                enabled = true,
                font = "14",
            },
        },
    }
    require("zen-mode").toggle()
end)
