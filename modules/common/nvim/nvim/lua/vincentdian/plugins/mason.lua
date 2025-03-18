return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
	},
	init = function()
		local mason = require("mason")
		local mason_lspconfig = require("mason-lspconfig")

		mason.setup()

		mason_lspconfig.setup({
			ensure_installed = {
				"lua_ls",
				"gopls",
				"ts_ls",
				"svelte",
				"tailwindcss",
				"clangd",
				"rust_analyzer",
			},
		})
	end,
}
