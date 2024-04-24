return {
  "goolord/alpha-nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },

  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.startify")

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


    dashboard.section.header.opts.hl = "Include"
    dashboard.section.header.opts.position = "center"
    dashboard.section.headerPaddingTop = { type = "padding", val = headerPadding }
    dashboard.section.headerPaddingBottom = { type = "padding", val = 2 }

    alpha.setup(dashboard.opts)
  end,
}
