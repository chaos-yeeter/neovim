local file_browser_actions = require("telescope").extensions.file_browser.actions

-- use <leader>e to open file browser
Utils.map("n", "<leader>e", ":Telescope file_browser<CR>")

-- setup file browser keymaps
require("telescope").setup({
	extensions = {
		file_browser = {
			mappings = {
				["n"] = {
					["n"] = file_browser_actions.create,
					["r"] = file_browser_actions.rename,
					["m"] = file_browser_actions.move,
					["c"] = file_browser_actions.copy,
					["d"] = file_browser_actions.remove,
					["."] = file_browser_actions.change_cwd,
					["u"] = file_browser_actions.goto_parent_dir,
					["<C-h>"] = file_browser_actions.toggle_hidden,
				},
			},
			display_stat = false,
		},
	},
})

-- load plugin
require("telescope").load_extension("file_browser")
