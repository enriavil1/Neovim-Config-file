return {
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.6',
    lazy = false,
    dependencies = { 'nvim-lua/plenary.nvim', "nvim-telescope/telescope-ui-select.nvim"},
    keys = {
      { "<leader>f", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
      { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Find Buffers" },
      { "<leader>F", "<cmd>Telescope live_grep<cr>", desc = "Live Grep" },
    },
    config = function()
      require("telescope").setup ({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({})
          }
        }
      })

      require("telescope").load_extension("ui-select")
    end
  },
}

