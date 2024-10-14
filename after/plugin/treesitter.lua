require'nvim-treesitter.configs'.setup {
    ensure_installed = { "lua", "python", "gitcommit", "toml", "bash" },
    sync_install = false,
    auto_install = true,
    highlight = {
        enable = true,
        disable = { "python" },
        additional_vim_regex_highlighting = false,
    },
    indent = {
        enable = true,
        disable = { "python" },
    },
}
