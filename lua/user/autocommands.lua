vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  pattern = { "*.ts", "*.tsx" },
  callback = function()
    vim.lsp.buf.format { async = true }
  end,
})
