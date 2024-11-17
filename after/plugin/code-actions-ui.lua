require("telescope").setup({
	extensions = {
		["ui-jselect"] = {
			require("telescope.themes").get_dropdown({}),
		},
	},
})
require("telescope").load_extension("ui-select")
