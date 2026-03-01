return {
	"nvimtools/none-ls.nvim",
	dependencies = {
		"williamboman/mason.nvim",
		"jayp0521/mason-null-ls.nvim",
	},
	config = function()
		-- import null-ls plugin safely
		local setup, null_ls = pcall(require, "null-ls")
		if not setup then
			return
		end

		-- for conciseness
		local formatting = null_ls.builtins.formatting -- to setup formatters
		local diagnostics = null_ls.builtins.diagnostics -- to setup linters

		-- to setup format on save
		local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
		null_ls.setup({
			sources = {
				--  to disable file types use
				--  "formatting.prettier.with({disabled_filetypes: {}})" (see null-ls docs)
				formatting.prettier.with({
					filetypes = {
						"html",
						"svg",
						"xml",
						"json",
						"rust",
						"svelte",
						"markdown",
						"css",
						"javascript",
						"javascriptreact",
						"typescript",
						"typescriptreact",
					},
					extra_filetypes = { "svelte" },
				}), -- js/ts formatter
				formatting.stylua, -- lua formatter
				formatting.goimports, -- go formatter
				formatting.golines, -- go formatter
			},
			-- configure format on save
			on_attach = function(client, bufnr)
				if client.supports_method("textDocument/formatting") then
					vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
					vim.api.nvim_create_autocmd("BufWritePre", {
						group = augroup,
						buffer = bufnr,
						callback = function()
							-- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
							-- on later neovim version, you should use vim.lsp.buf.format({ async = false }) instead
							vim.lsp.buf.format({ async = false })
						end,
					})
				end
			end,
		})

		-- import mason-null-ls plugin safely
		local mason_null_ls_status, mason_null_ls = pcall(require, "mason-null-ls")
		if not mason_null_ls_status then
			return
		end

		mason_null_ls.setup({
			-- list of formatters & linters for mason to install
			ensure_installed = {
				"stylua", -- lua formatter
				"goimports",
				"golines",
				"prettier",
			},
			-- auto-install configured formatters & linters (with null-ls)
			automatic_installation = true,
		})
	end,
}
