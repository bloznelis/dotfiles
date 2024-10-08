return {
  "Olical/conjure",
  branch = "develop",
  ft = { "clojure" },
  config = function()
    require("conjure.main").main()
    require("conjure.mapping")["on-filetype"]()
    vim.api.nvim_create_autocmd("BufNewFile", {
      group = vim.api.nvim_create_augroup("conjure_log_disable_lsp", { clear = true }),
      pattern = { "conjure-log-*" },
      callback = function(event)
        vim.diagnostic.enable(false, event.buf)
      end,
      desc = "Conjure Log disable LSP diagnostics",
    })
  end,
  init = function()
    vim.g["conjure#log#hud#width"] = 1
    vim.g["conjure#log#hud#enabled"] = true
    vim.g["conjure#log#hud#anchor"] = "SE"
    vim.g["conjure#log#botright"] = true
    vim.g["conjure#extract#context_header_lines"] = 100
    vim.g["conjure#eval#comment_prefix"] = ";; "

    vim.g["conjure#mapping#enable_defaults"] = false -- disables default Conjure bindings

    vim.g["conjure#mapping#eval_current_form"] = "ee"
    vim.g["conjure#mapping#eval_root_form"] = "er"
    vim.g["conjure#mapping#eval_comment_root_form"] = "e;"
    vim.g["conjure#mapping#eval_buf"] = "eb"
    vim.g["conjure#mapping#eval_visual"] = "E"
    vim.g["conjure#mapping#doc_word"] = "ek"

    vim.g["conjure#mapping#log_toggle"] = "el"
    vim.g["conjure#mapping#doc_word"] = ""
  end,
}
