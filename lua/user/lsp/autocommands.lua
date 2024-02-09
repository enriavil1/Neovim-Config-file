local status_ok, go = pcall(require, 'go')
if not status_ok then
  vim.notify("Couldn't import go")
  return
end

go.setup()

vim.cmd [[
  augroup go_lsp
  	autocmd!
  	autocmd BufWritePre * :silent! lua vim.lsp.buf.format()
  augroup end
]]

local format_sync_grp = vim.api.nvim_create_augroup("GoImport", {})
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
    require('go.format').goimport()
  end,
  group = format_sync_grp,
})
