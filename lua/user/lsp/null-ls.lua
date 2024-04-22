local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
  return
end

local status_ok_2, mason_null_ls = pcall(require, "mason-null-ls")
if not status_ok_2 then
  return
end


-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

mason_null_ls.setup({
  -- Providing an empty handlers will cause all sources to be automatically registered in null-ls
  handlers = {},
})

null_ls.setup {
  debug = false,
  sources = {
    formatting.clang_format,
    formatting.prettier,
    formatting.black.with { extra_args = { "--fast" } },
    -- formatting.yapf,
    formatting.stylua,
    diagnostics.flake8,
    formatting.standardrb,
  },
}
