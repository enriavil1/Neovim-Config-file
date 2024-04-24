return {
  "williamboman/mason-lspconfig.nvim",
  config = function()
    require("mason-lspconfig").setup({
      automatic_installation = true,
      ensure_intalled = { "lua_ls" },
    })
  end,
}
