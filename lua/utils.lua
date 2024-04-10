Utils = {}

-- map keys
function Utils.map(mode, key, command, options)
	vim.keymap.set(mode, key, command, options)
end

-- set options
function Utils.set(option, value)
	vim.opt[option] = value
end

-- change keymap
function Utils.change_keymap(mode, new_keymap, old_keymap)
	vim.api.nvim_set_keymap(mode, new_keymap, old_keymap, {})
end

return Utils
