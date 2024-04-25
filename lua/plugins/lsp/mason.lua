return {
  "williamboman/mason.nvim",
  config = function()
    require("mason").setup({ ensure_installed = { "lua_ls" } })
  end
}
