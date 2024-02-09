local status_ok, mason = pcall(require, "mason")
if not status_ok then
  return
end

local status_ok_1, mason_lspconfig = pcall(require, "mason-lspconfig")
if not status_ok_1 then
  return
end

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
  "cssmodules_ls",
  "lua_ls",
  "gopls",
  "golangci_lint_ls",
  "pyright",
  "jsonls",
  "graphql",
  "eslint",
  "clangd"
}

mason.setup(settings)
mason_lspconfig.setup {
  automatic_installation = false
}

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
  return
end

local handlers_status_ok, handlers = pcall(require, "user.lsp.handlers")
if not handlers_status_ok then
  print("Failed to get handler from handler.lua")
  return
end

-- Register a handler that will be called for all installed servers.
-- Alternatively, you may also register handlers on specific server instances instead (see example below).
for _, server in pairs(servers) do
  server = vim.split(server, "@")[1]

  local opts = {
    on_attach = handlers.on_attach,
    capabilities = handlers.capabilities,
  }

  if server == "jsonls" then
    local jsonls_opts = require("user.lsp.settings.jsonls")
    opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
  end
  if server == "lua_ls" then
    local lua_ls_opts = require("user.lsp.settings.lua_ls")
    opts = vim.tbl_deep_extend("force", lua_ls_opts, opts)
  end

  if server == "pyright" then
    local pyright_opts = require("user.lsp.settings.pyright")
    opts = vim.tbl_deep_extend("force", pyright_opts, opts)
  end

  if server == "gopls" then
    local gopls_opts = require("user.lsp.settings.gopls")
    opts = vim.tbl_deep_extend("force", gopls_opts, opts)
  end

  if server == "eslint" then
    lspconfig.eslint.setup {
      root_dir = function() return vim.loop.cwd() end
    }
    lspconfig.tsserver.setup(opts)
  end

  if server == 'graphql' then
    lspconfig.graphql.setup {
      root_dir = function() return vim.loop.cwd() end
    }
  end

  -- This setup() function is exactly the same as lspconfig's setup function.
  -- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
  lspconfig[server].setup(opts)
end
