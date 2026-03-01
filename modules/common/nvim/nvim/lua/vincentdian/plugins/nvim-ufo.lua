return {
	"kevinhwang91/nvim-ufo",
	-- optional, but required for fuzzy finder support
	dependencies = {
		"kevinhwang91/promise-async",
	},
	config = function()
		vim.o.foldcolumn = "1" -- '0' is not bad
		vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
		vim.o.foldlevelstart = 99
		vim.o.foldenable = true
		local ufo = require("ufo")
		ufo.setup({
			provider_selector = function(bufnr, filetype, buftype)
				return { "treesitter", "indent" }
			end,
		})
		vim.keymap.set("n", "<leader>oO", ufo.openAllFolds)
		vim.keymap.set("n", "<leader>oC", ufo.closeAllFolds)
		vim.keymap.set("n", "<leader>oo", ":foldopen<CR>")
		vim.keymap.set("n", "<leader>oc", ":foldclose<CR>") -- closeAllFolds == closeFoldsWith(0)
	end,
}
