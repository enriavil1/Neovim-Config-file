return {
  "folke/noice.nvim",
  event = "VeryLazy",
  keys = {
    "<leader>dm", ":Noice dismiss<CR>", desc = "Dismiss notifications"
  },
  opts = {
    cmdline = {
      view = "cmdline"
    },
    lsp = {
      hover = {
        silent = true
      }
    }
  },
  dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
  },
}
