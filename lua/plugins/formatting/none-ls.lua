return {
  "nvimtools/none-ls.nvim",
  dependencies = {
    "mason.nvim",
    "nvimtools/none-ls-extras.nvim",
  },
  lazy = false,
  keys = { { "<leader>gf", vim.lsp.buf.format, desc = "Format current buffer" } },
  init = function()
    -- On save we format the file
    vim.api.nvim_create_autocmd("BufWritePre", {
      callback = function()
        vim.lsp.buf.format()
      end,
    })
  end,
  opts = function(_, opts)
    local null_ls = require("null-ls")

    opts.sources = vim.list_extend(opts.sources or {}, {
      null_ls.builtins.formatting.stylua,

      -- js/ts
      null_ls.builtins.formatting.prettier,
      require("none-ls.diagnostics.eslint"),

      -- C++
      null_ls.builtins.diagnostics.cmake_lint,
    })
  end,
}
