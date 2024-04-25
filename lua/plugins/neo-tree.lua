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

      opts.default_component_configs = {
        git_status = {
          symbols = {
            -- Change type
            added     = "✚", -- or "✚", but this is redundant info if you use git_status_colors on the name
            modified  = "", -- or "", but this is redundant info if you use git_status_colors on the name
            deleted   = "✖", -- this can only be used in the git_status source
            renamed   = "󰁕", -- this can only be used in the git_status source
            -- Status type
            untracked = "",
            ignored   = "",
            unstaged  = "󰄱",
            staged    = "",
            conflict  = "",
          }
        }
      }
    end
  }
}
