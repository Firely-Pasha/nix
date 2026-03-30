return {
	"neovim/nvim-lspconfig", -- REQUIRED: for native Neovim LSP integration
	lazy = false, -- REQUIRED: tell lazy.nvim to start this plugin at startup
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"hrsh7th/nvim-cmp",
		"L3MON4D3/LuaSnip", -- snippet engine
		"onsails/lspkind.nvim",
		"akinsho/flutter-tools.nvim",
	},
	init = function()
		local mason = require("mason")
		local mason_lspconfig = require("mason-lspconfig")
		local cmp = require("cmp")
		local capabilities = require("cmp_nvim_lsp").default_capabilities()
		-- local luasnip = require("luasnip")
		-- local lspkind = require("lspkind")

		local flutter_tools = require("flutter-tools")

		cmp.setup({
			completion = {
				completeopt = "menu,menuone,noinsert",
			},
			snippet = {
				-- REQUIRED - you must specify a snippet engine
				expand = function(args)
					vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)
				end,
			},
			mapping = cmp.mapping.preset.insert({
				["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
				["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
				["<C-b>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-l>"] = cmp.mapping.complete(), -- show completion suggestions
				["<C-e>"] = cmp.mapping.abort(), -- close completion window
				["<Tab>"] = cmp.mapping.confirm({ select = false }),
			}),
			sources = cmp.config.sources({
				{ name = "nvim_lsp" }, -- lsp
				{ name = "buffer" }, -- text within current buffer
				{ name = "path" }, -- file system paths
			}),
			-- configure lspkind for vs-code like icons
			formatting = {
				format = function(entry, vim_item)
					-- require("tailwindcss-colorizer-cmp").formatter(entry, vim_item)
					return vim_item
				end,
			},
		})

		local keymap = vim.keymap
		local lsp = vim.lsp.buf
		local diagnostic = vim.diagnostic

		-- enable keybinds only for when lsp server available
		local on_attach = function(client, bufnr)
			-- keybind options
			local opts = { noremap = true, silent = true, buffer = bufnr }
			-- set keybinds
			keymap.set("n", "<leader>gD", lsp.declaration, opts) -- got to declaration
			keymap.set("n", "<leader>gd", lsp.definition, opts) -- see definition and make edits in window
			keymap.set("n", "<leader>gi", lsp.implementation, opts) -- go to implementation
			-- keymap.set("n", "<leader>gr", lsp.references, opts) -- go to implementation
			keymap.set("n", "<leader>ca", lsp.code_action, opts) -- see available code actions
			keymap.set("n", "<leader>lr", lsp.rename, opts) -- smart rename
			keymap.set("n", "<leader>e", diagnostic.open_float, opts) -- show diagnostics for cursor
			keymap.set("n", "[d", diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer
			keymap.set("n", "]d", diagnostic.goto_next, opts) -- jump to next diagnostic in buffer
			keymap.set("n", "<leader>q", diagnostic.setloclist, opts) -- show documentation for what is under cursor
			keymap.set("n", "<leader>lk", lsp.hover, opts) -- show documentation for what is under cursor
			keymap.set("n", "<leader>T", lsp.type_definition, opts) -- show documentation for what is under cursor
			-- keymap.set("n", "<leader>f", lsp.formatting, opts) -- show documentation for what is under cursor
			keymap.set("n", "<leader>wa", lsp.add_workspace_folder, opts) -- show documentation for what is under cursor
			-- keymap.set("n", "<leader>lo", "<cmd>Lspsaga outline<CR>", opts) -- see outline on right hand side
			-- typescript specific keymaps (e.g. rename file and update imports)
			if client.name == "ts_ls" then
				keymap.set("n", "<leader>sr", ":TypescriptRenameFile<CR>", opts) -- rename file and update imports
				keymap.set("n", "<leader>si", ":TypescriptOrganizeImports<CR>", opts) -- organize imports (not in youtube nvim video)
				keymap.set("n", "<leader>su", ":TypescriptRemoveUnused<CR>", opts) -- remove unused variables (not in youtube nvim video)
			end
		end
		flutter_tools.setup({
			lsp = {
				on_attach = on_attach,
				capabilities = capabilities,
			},
		})
		local ls = {
			"clangd",
			"gopls",
			"lua_ls",
			"pylsp",
			"rust_analyzer",
			"svelte",
			"tailwindcss",
			"ts_ls",
			"kotlin_lsp",
		}
		mason.setup()
		mason_lspconfig.setup({
			ensure_installed = ls,
		})
		if mason_lspconfig.setup_handlers ~= nil then
			mason_lspconfig.setup_handlers({
				function(server_name) -- default handler (optional)
					require("lspconfig")[server_name].setup({
						on_attach = on_attach,
						capabilities = capabilities,
					})
				end,
				-- ["rust_analyzer"] = function()
				-- 	require("rust-tools").setup({})
				-- end,
			})
		else
			for _, value in ipairs(ls) do
				vim.lsp.config(value, {
					on_attach = on_attach,
					capabilities = capabilities,
				})
			end
		end
	end,
}
