local utils = require("utils")
local telescope = require("telescope")
local builtin = require("telescope.builtin")

-- show hidden files
telescope.setup {
    pickers = {
        find_files = {
            hidden = true
        }
    }
}

-- search
local search_trigger = '<leader>f'
utils.map("n", string.format("%sg", search_trigger), builtin.git_files)
utils.map("n", string.format("%sf", search_trigger), function()
    builtin.find_files({ find_command =  {'rg', '--files', '--hidden', '-g', '!.git' }})
end)
utils.map("n", string.format("%sw", search_trigger), builtin.live_grep)
utils.map("n", string.format("%sb", search_trigger), builtin.buffers)
