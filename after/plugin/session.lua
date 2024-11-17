local session_dir = vim.fn.expand("$HOME/.sessions/neovim/")
local session_autocmd_group = vim.api.nvim_create_augroup("AutoSessionLoader", { clear = true })

-- ref: https://neovim.io/doc/user/options.html#'sessionoptions'
Utils.set("sessionoptions", "buffers,curdir,folds,resize,tabpages,winsize,options")

local function exists(path)
	local success, err = os.rename(path, path)
	return not err and success
end

vim.api.nvim_create_autocmd({ "VimLeavePre" }, {
	pattern = { "*" },
	desc = "Create session on exit",
	nested = true,
	once = true,
	callback = function()
		-- do not create session when neovim is called with args e.g. rebase, commit, etc.
		print("In create session")
		if next(vim.fn.argv()) ~= nil then
			return
		end

		-- create session directory if it does not exist
		if not exists(session_dir) then
			os.execute("mkdir -p " .. session_dir)
		end

		local current_working_dirname = string.gmatch(vim.fn.getcwd(), "[%a-_]+$")()
		local session_file_path = session_dir .. current_working_dirname .. ".vim"
		vim.cmd("silent mksession! " .. session_file_path)
	end,
	group = session_autocmd_group,
})

vim.api.nvim_create_autocmd({ "VimEnter" }, {
	pattern = { "*" },
	desc = "Load session if one exists",
	nested = true,
	once = true,
	callback = function()
		-- do not load session when neovim is called with args e.g. rebase, commit, etc.
		if next(vim.fn.argv()) ~= nil then
			return
		end

		local current_working_dirname = string.gmatch(vim.fn.getcwd(), "[%a-_]+$")()
		local session_file_path = session_dir .. current_working_dirname .. ".vim"
		if not exists(session_file_path) then
			return
		end

		vim.cmd("silent source " .. session_file_path)
	end,
	group = session_autocmd_group,
})
