return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	build = ":TSUpdate",
	config = function()
		local config = require("nvim-treesitter")
		local parsers = {
			"lua",
			"vim",
			"vimdoc",
			"go",
			"markdown",
			"markdown_inline",
			"svelte",
			"css",
			"html",
			"javascript",
			"typescript",
			"rust",
			"json",
		}
		config.setup({
			sync_install = false,
			highlight = { enable = true },
			indent = { enable = true },
		})
		config.install(parsers)
		local fileTypes = {
			"go",
			"rust",
			"svelte",
			"json",
			"typescript",
			"javascript",
			"css",
		}
		vim.api.nvim_create_autocmd("FileType", {
			pattern = fileTypes,
			callback = function()
				vim.treesitter.start()
			end,
		})
		-- vim.api.nvim_create_autocmd("FileType", {
		-- 	pattern = {
		-- 		"*.go",
		-- 		"*.ts",
		-- 		"*.js",
		-- 		"*.svelte",
		-- 		"*.css",
		-- 		"*.html",
		-- 		"*.rs",
		-- 		"*.md",
		-- 		"*.lua",
		-- 		"*.json",
		-- 	},
		-- 	callback = function()
		-- 		vim.treesitter.start()
		-- 	end,
		-- })
	end,
}
