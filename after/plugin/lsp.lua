local builtin = require("telescope.builtin")
local cmp = require("cmp")
local luasnip = require("luasnip")

cmp.setup({
	completion = {
		completeopt = "menu,menuone,preview,noselect",
	},
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
	mapping = cmp.mapping.preset.insert({
		["<C-u>"] = cmp.mapping.scroll_docs(-4),
		["<C-d>"] = cmp.mapping.scroll_docs(4),
		["<C-j>"] = cmp.mapping.select_next_item(),
		["<C-k>"] = cmp.mapping.select_prev_item(),
		["<C-c>"] = cmp.mapping.abort(),
		["<C-l>"] = cmp.mapping(function(_)
			if luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			else
				cmp.confirm({ select = true })
			end
		end, { "i", "s" }),
		["<C-h>"] = cmp.mapping(function(_)
			if luasnip.jumpable(-1) then
				luasnip.jump(-1)
			end
		end, { "i", "s" }),
	}),
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
		{
			name = "path",
			option = {
				trailing_slash = true,
				get_cwd = function()
					return vim.fn.resolve(vim.fn.getcwd())
				end,
			},
		},
		{ name = "buffer" },
	}),
})

require("cmp_nvim_lsp").setup({
	sources = {
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
	},
})

local handlers = {
	["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" }),
	["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" }),
}

-- ref: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
local capabilities = require("cmp_nvim_lsp").default_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local lsp_config = require("lspconfig")
lsp_config.pyright.setup({ capabilities = capabilities, handlers = handlers })
lsp_config.ruff_lsp.setup({ capabilities = capabilities })
lsp_config.taplo.setup({ capabilities = capabilities, handlers = handlers })
lsp_config.lua_ls.setup({ capabilities = capabilities, handlers = handlers })
lsp_config.nil_ls.setup({ capabilities = capabilities, handlers = handlers })
lsp_config.ts_ls.setup({ capabilities = capabilities, handlers = handlers })
lsp_config.biome.setup({ capabilities = capabilities })
lsp_config.tailwindcss.setup({ capabilities = capabilities, handlers = handlers })
lsp_config.yamlls.setup({ capabilities = capabilities, handlers = handlers })
lsp_config.html.setup({ capabilities = capabilities, handlers = handlers })
lsp_config.cssls.setup({ capabilities = capabilities, handlers = handlers })
lsp_config.eslint.setup({ capabilities = capabilities, handlers = handlers })
lsp_config.jsonls.setup({ capabilities = capabilities, handlers = handlers })

-- setup keybindings
local lsp_trigger = "<leader>l"
Utils.map("n", string.format("%sa", lsp_trigger), vim.lsp.buf.code_action)
Utils.map("n", string.format("%sS", lsp_trigger), builtin.lsp_dynamic_workspace_symbols)
Utils.map("n", string.format("%sR", lsp_trigger), vim.lsp.buf.rename)
Utils.map("n", "K", vim.lsp.buf.hover)
Utils.map("n", "<C-s>", vim.lsp.buf.signature_help)
Utils.map("i", "<C-s>", vim.lsp.buf.signature_help)
