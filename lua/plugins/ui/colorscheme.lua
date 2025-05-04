return {
  {
    -- add gruvbox
    -- "ellisonleao/gruvbox.nvim"
    "luisiacc/gruvbox-baby",
    lazy = false,    -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      -- Enable telescope theme
      vim.g.gruvbox_baby_telescope_theme = 1

      -- Enable transparent mode
      vim.g.gruvbox_baby_transparent_mode = 1

      -- load the colorscheme here
      vim.cmd([[colorscheme gruvbox-baby]])
    end,
  }
}
