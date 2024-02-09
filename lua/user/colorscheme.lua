-- vim.cmd "colorscheme aurora"
local colorscheme = "gruvbox-baby"
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  print("colorscheme " .. colorscheme .. " nout found!")
  return
end
