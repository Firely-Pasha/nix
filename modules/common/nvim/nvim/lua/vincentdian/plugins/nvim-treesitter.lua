return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local config = require("nvim-treesitter")
		config.setup({
			sync_install = false,
			highlight = { enable = true },
			indent = { enable = true },
		})
		config.install({
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
		})
		vim.api.nvim_create_autocmd("FileType", {
			pattern = { "<filetype>" },
			callback = function()
				vim.treesitter.start()
			end,
		})
	end,
}
