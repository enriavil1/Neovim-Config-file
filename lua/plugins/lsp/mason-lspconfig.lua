local keymap_callback = require("plugins.lsp.nvim-lspconfig.config-callback")

return {
	"williamboman/mason-lspconfig.nvim",
	dependencies = { "neovim/nvim-lspconfig", "hrsh7th/cmp-nvim-lsp" },
	init = function()
		keymap_callback()

		local mason_lspconfig = require("mason-lspconfig")
		mason_lspconfig.setup({
			automatic_installation = true,
			ensure_installed = { "lua_ls" },
		})

		local capabilities = require("cmp_nvim_lsp").default_capabilities()
		local lspconfig = require("lspconfig")

		-- Automatic set up of the the lsp servers
		mason_lspconfig.setup_handlers({
			function(server_name) -- default handler (optional)
				local opt = { capabilities = capabilities }
				if server_name == "clangd" then
					opt["cmd"] = {
						"clangd",
						"--offset-encoding=utf-16",
					}
				end

				lspconfig[server_name].setup(opt)
			end,
		})
	end,
}
