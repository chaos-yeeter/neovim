require'nvim-treesitter.configs'.setup {
    ensure_installed = { "lua" },
    sync_install = false,
    auto_install = true,
    highlight = {
        enable = true,
        disable = { "python" }, -- to avoid glitched indenting in python
        additional_vim_regex_highlighting = false,
    },
}
