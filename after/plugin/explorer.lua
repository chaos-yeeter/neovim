local utils = require("utils")
local fb_actions = require ("telescope").extensions.file_browser.actions

-- use <leader>e to open file browser
utils.map("n", "<leader>e", ":Telescope file_browser<CR>")

-- setup file browser keymaps
require('telescope').setup {
	extensions = {
		file_browser = {
			mappings = {
				["n"] = {
					["n"] = fb_actions.create,
					["r"] = fb_actions.rename,
					["m"] = fb_actions.move,
					["c"] = fb_actions.copy,
					["d"] = fb_actions.remove,
					["."] = fb_actions.change_cwd,
					["u"] = fb_actions.goto_parent_dir,
					["<C-h>"] = fb_actions.toggle_hidden,
				}
			},
			display_stat = false
		}
	}
}

-- load plugin
require("telescope").load_extension("file_browser")
