return {
  "goolord/alpha-nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },

  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    -- dynamic header padding
    local fn = vim.fn
    local marginTopPercent = 0.3
    local headerPadding = fn.max { 2, fn.floor(fn.winheight(0) * marginTopPercent) }

    dashboard.section.header.val = {
      [[                                                                       ]],
      [[                                                                       ]],
      [[                                                                       ]],
      [[                                                                       ]],
      [[                                                                     ]],
      [[       ████ ██████           █████      ██                     ]],
      [[      ███████████             █████                             ]],
      [[      █████████ ███████████████████ ███   ███████████   ]],
      [[     █████████  ███    █████████████ █████ ██████████████   ]],
      [[    █████████ ██████████ █████████ █████ █████ ████ █████   ]],
      [[  ███████████ ███    ███ █████████ █████ █████ ████ █████  ]],
      [[ ██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
      [[                                                                       ]],
      [[                                                                       ]],
      [[                                                                       ]],
    }

    dashboard.section.buttons.val = {
      dashboard.button("f", "  > Find file", ":Telescope find_files <CR>"),
      dashboard.button("e", "  > New file", ":ene <BAR> startinsert <CR>"),
      dashboard.button("r", "  > Recently used files", ":Telescope oldfiles <CR>"),
      dashboard.button("t", "  > Find text", ":Telescope live_grep <CR>"),
      dashboard.button("c", "  > Configuration", ":e ~/.config/nvim/init.lua <CR>"),
      dashboard.button("q", "  > Quit Neovim", ":qa<CR>"),
    }

    dashboard.section.header.opts.hl = "Include"
    dashboard.section.header.opts.position = "center"
    dashboard.section.headerPaddingTop = { type = "padding", val = headerPadding }
    dashboard.section.headerPaddingBottom = { type = "padding", val = 2 }

    dashboard.section.footer.opts.hl = "Type"

    alpha.setup(dashboard.opts)
  end,
}
