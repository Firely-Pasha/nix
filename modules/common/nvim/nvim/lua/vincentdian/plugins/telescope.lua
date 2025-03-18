return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		local telescope = require("telescope")
		local builtin = require("telescope.builtin")
		local actions = require("telescope.actions")
		telescope.setup({
			defaults = {
				sorting_strategy = "ascending",
				layout_strategy = "horizontal",
				layout_config = { prompt_position = "top" },
				border = true,
				mappings = {
					["i"] = {
						["<C->>"] = actions.cycle_history_next,
						["<C-<>"] = actions.cycle_history_prev,
					},
					["n"] = {
						["<C->>"] = actions.cycle_history_next,
						["<C-<>"] = actions.cycle_history_prev,
					},
				},
			},
		})
		vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
		vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
		vim.keymap.set("n", "<leader>fB", builtin.buffers, {})
		vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
		vim.keymap.set("n", "<leader>gr", builtin.lsp_references, {})
		vim.keymap.set("n", "<leader>lo", builtin.lsp_document_symbols, {})
		vim.keymap.set("n", "<leader>lO", builtin.lsp_workspace_symbols, {})
		vim.keymap.set("n", "<leader>ld", builtin.diagnostics, {})
		-- vim.keymap.set("n", "<leader>lD", builtin.lsp_workspace_diagnostics, {})
	end,
}
