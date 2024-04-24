local mason_config = require('plugins.lsp.mason')
local mason_lspconfig = require('plugins.lsp.mason-lspconfig')
local nvim_lspconfig = require('plugins.lsp.nvim-lspconfig')

return {
  mason_config,
  mason_lspconfig,
  nvim_lspconfig
}
