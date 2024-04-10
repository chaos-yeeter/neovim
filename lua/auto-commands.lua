local format_autocmd_group = vim.api.nvim_create_augroup("AutoFormat", { clear = true })

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
    pattern = { "*.py" },
    desc = "Format python file after saving",
    callback = function()
        local fileName = vim.api.nvim_buf_get_name(0)
        vim.cmd(":silent !ruff check --fix " .. fileName)
        vim.cmd(":silent !ruff format " .. fileName)
      end,
    group = format_autocmd_group,
})