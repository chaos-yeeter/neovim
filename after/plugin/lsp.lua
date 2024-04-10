local utils = require("utils")
local builtin = require('telescope.builtin')
local cmp = require("cmp")
local mason_lsp = require("mason-lspconfig")

require("mason").setup()

mason_lsp.setup()

cmp.setup({
	snippet = {
		expand = function(args)
			require('luasnip').lsp_expand(args.body)
		end,
	},
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
	mapping = cmp.mapping.preset.insert({
		['<C-b>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-j>'] = cmp.mapping.select_next_item(),
		['<C-k>'] = cmp.mapping.select_prev_item(),
		['<Esc>'] = cmp.mapping.abort(),
		['<CR>'] = cmp.mapping.confirm({ select = true }),
	}),
	sources = cmp.config.sources({
		{ name = 'luasnip' },
		{ name = 'nvim_lsp' },
	}, {
		{ name = 'buffer' },
	})
})

local capabilities = require('cmp_nvim_lsp').default_capabilities()

require("cmp_nvim_lsp").setup {
	sources = {
		{ name = "luasnip" },
		{ name = "nvim_lsp" },
	}
}

require("mason-lspconfig").setup_handlers {
	function (server_name)
		require("lspconfig")[server_name].setup {
			capabilities = capabilities
		}
	end
}

require('lspconfig').gopls.setup({
    settings = {
        gopls = {
            gofumpt = true
        }
    }
})

-- setup keybindings
local lsp_trigger = '<leader>l'
utils.map('n', string.format('%sd', lsp_trigger), builtin.lsp_definitions)
utils.map('n', string.format('%sa', lsp_trigger), vim.lsp.buf.code_action)
utils.map('n', string.format('%sr', lsp_trigger), builtin.lsp_references)
utils.map("n", string.format("%ss", lsp_trigger), builtin.lsp_workspace_symbols)
utils.map('n', string.format('%sD', lsp_trigger), function() builtin.diagnostics({ bufnr = 0 }) end)
utils.map("n", string.format("%sR", lsp_trigger), vim.lsp.buf.rename)
utils.map("n", string.format("K", lsp_trigger), vim.lsp.buf.hover)
