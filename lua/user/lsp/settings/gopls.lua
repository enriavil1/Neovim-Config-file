return {
	settings = {
    gopls = {
      -- root_dir = lspconfig.util.root_pattern("go.mod", ".git"),
      experimentalPostfixCompletions = true,
		  analyses = {
		    unusedparams = true,
		    shadow = true,
		  },
		  staticcheck = true,
    }
	},
}
