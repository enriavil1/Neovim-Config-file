return {
  "nvim-neo-tree/neo-tree.nvim",
  keys = {
    { "<leader>e",  "<cmd>Neotree toggle<cr>",                    desc = "NeoTree" },
    { "<leader>eb", "<cmd> Neotree buffers toggle float<cr>",     desc = "Buffer" },
    { "<leader>es", "<cmd> Neotree document_symbols toggle <cr>", desc = "Document Symbols" },
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-tree/nvim-web-devicons", lazy = true },
    "MunifTanjim/nui.nvim",
  },
  opts = {
    sources = { "filesystem", "buffers", "git_status", "document_symbols" },
    event_handlers = {
      {
        event = "file_opened",
        -- Close Neotree whenever something is picked
        handler = function(_)
          -- auto close
          -- vimc.cmd("Neotree close")
          -- OR
          require("neo-tree.command").execute({ action = "close" })
        end
      },
    },
    default_component_configs = {
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
  }
}
