return {
	"epwalsh/obsidian.nvim",
	version = "*",
	lazy = true,
	event = {
		-- only load plugin when opening obsidian vault
		"BufReadPre "
			.. vim.fn.expand("~")
			.. "/projects/wiki/*.md",
	},
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	opts = {
		workspaces = {
			{
				name = "wiki",
				path = "~/projects/wiki/",
			},
		},
	},
}
