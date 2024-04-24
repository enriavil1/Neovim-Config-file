return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    keys = {
      { "<leader>e",  "<cmd>Neotree toggle<cr>",                desc = "NeoTree" },
      { "<leader>eb", "<cmd> Neotree buffers reveal float<cr>", desc = "Buffer" },
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
      { "nvim-tree/nvim-web-devicons", lazy = true },
      "MunifTanjim/nui.nvim",
    },
    opts = function(_, opts)
      opts.event_handlers = {
        {
          event = "file_opened",
          handler = function(_)
            -- auto close
            -- vimc.cmd("Neotree close")
            -- OR
            require("neo-tree.command").execute({ action = "close" })
          end
        },

      }
    end
  }
}
