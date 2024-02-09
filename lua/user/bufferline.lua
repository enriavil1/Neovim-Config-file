local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
  return
end

bufferline.setup {
  options = {
    indicator = {
      icon = '▎', -- this should be omitted if indicator style is not 'icon'
      style = 'icon',
    },
    themeable = true,
    max_name_length = 30,
    max_prefix_length = 30,   -- prefix used when a buffer is de-duplicated
    tab_size = 21,
    diagnostics = "nvim_lsp", -- | "nvim_lsp" | "coc",
    offsets = { { filetype = "NvimTree", text = "", padding = 1 } },
    show_tab_indicators = true,
    modified_icon = '●',
    show_close_icon = false,
    show_buffer_icons = true,
    -- [focused and unfocused]. eg: { '|', '|' }
    separator_style = "thin", -- | "thick" | "thin" | { 'any', 'any' },
  },
}
