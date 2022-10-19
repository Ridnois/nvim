local settings = {
  ui = {
    border = "rounded",
    icons = {
      package_installed = "◍",
      package_pending = "◍",
      package_uninstalled = "◍",
    },
  },
  log_level = vim.log.levels.INFO,
  max_concurrent_installers = 4,
}
local servers = {
  "sumneko_lua",
  "rust_analyzer",
  "tsserver",
  "solang",
  --"solc",
  "solidity",
  "tailwindcss",
}

require("mason").setup(settings)
require("mason-lspconfig").setup({
  ensure_installed = servers,
  automatic_installation = true,
})

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")

if not lspconfig_status_ok then
  vim.notify "Failed"
  return
end

local opts = {}

for _, server in pairs(servers) do
  opts = {
    on_attach = require("user.lsp.handlers").on_attach,
    capabilities = require("user.lsp.handlers").capabilities,
  }
  if server == "sumneko_lua" then
    local l_status_ok, lua_dev = pcall(require, "lua-dev")
    if not l_status_ok then
      return
    end
    -- local sumneko_opts = require "user.lsp.settings.sumneko_lua"
    -- opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
    -- opts = vim.tbl_deep_extend("force", require("lua-dev").setup(), opts)
    local luadev = lua_dev.setup {
      --   -- add any options here, or leave empty to use the default settings
      -- lspconfig = opts,
      lspconfig = {
        on_attach = opts.on_attach,
        capabilities = opts.capabilities,
        --   -- settings = opts.settings,
      },
    }
    lspconfig.sumneko_lua.setup(luadev)
  end

  if server == "solc" then
    local solc_opts = {
      cmd = { "solc", "--lsp", "--include-path", "../node_modules" }
    }
    opts = vim.tbl_deep_extend("force", solc_opts, opts)
  end
  if server == "solang" then
    local solang_opts = {
      cmd = { "solang", "language-server", "--target", "evm", "--importpath", "node_modules/" }
    }
    opts = vim.tbl_deep_extend("force", solang_opts, opts)
  end
  lspconfig[server].setup(opts)
end
