-- use <leader>u to toggle undotree
vim.keymap.set("n", "<leader>u", function()
	vim.cmd.UndotreeToggle()
	vim.cmd.UndotreeFocus()
end, {})
