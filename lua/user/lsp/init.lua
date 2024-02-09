local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  vim.notify("Couldn't import lspconfig")
  return
end

require("user.lsp.lsp-installer")

require("user.lsp.autocommands")
require("user.lsp.null-ls")

local handlers_status_ok, handlers = pcall(require, "user.lsp.handlers")
if not handlers_status_ok then
  vim.notify("[lsp/init] Couldn't get handlers")
  return
end

handlers.setup()

