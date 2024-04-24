return {
  {
    "tpope/vim-fugitive"
  },
  {
    "lewis6991/gitsigns.nvim",

    keys = {
      { "<leader>gp", ":Gitsigns preview_hunk<CR>",              desc = "Preview Git Hunk" },
      { "<leader>gt", ":Gitsigns toggle_current_line_blame<CR>", desc = "Toggle line blame" }
    }
  }
}
