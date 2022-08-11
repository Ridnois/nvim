local null_ls_status_ok, null_ls
pcall(require, "null-ls")

if not null_ls_status_ok then
  return
end

local formatting = null_ls.builtins.formatting

null_ls.setup({
  sources = {
    require("null-ls").builtins.formatting.stylua,
    require("null-ls").builtins.diagnostics.eslint,
    require("null-ls").builtins.completion.spell,
    formatting.prettier.with {
      extra_filetypes = { "solidity" }
    }
  },

})
