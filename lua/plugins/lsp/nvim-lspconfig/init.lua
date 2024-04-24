local keymap_callback = require('plugins.lsp.nvim-lspconfig.config-callback')

return {
  "neovim/nvim-lspconfig",
  dependencies = { "hrsh7th/cmp-nvim-lsp" },
  config = function()
    -- sets up keymaps and diagnostic symbols
    keymap_callback()
    local capabilities = require('cmp_nvim_lsp').default_capabilities()

    local lspconfig = require("lspconfig")
    local servers = {
      "lua_ls",
      "gopls",
      "pyright",
      "tsserver",
      "graphql",
      "eslint",
      "clangd",
    }

    for _, server in pairs(servers) do
      lspconfig[server].setup({ capabilities = capabilities })
    end
  end,
}
