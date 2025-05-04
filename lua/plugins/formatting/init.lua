local none_ls = require("plugins.formatting.none-ls")
local treesitter = require("plugins.formatting.treesitter")
local blank_indent = require("plugins.formatting.blankindent")
local mini_indent = require("plugins.formatting.mini-indentscope")
local comments = require("plugins.formatting.comments")

return {
	none_ls,
	treesitter,
	blank_indent,
	mini_indent,
	comments,
}
