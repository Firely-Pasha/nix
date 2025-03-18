return {
	"nvim-telescope/telescope-file-browser.nvim",
	dependencies = {
		"nvim-telescope/telescope.nvim",
		"nvim-lua/plenary.nvim",
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")
		local fb = telescope.extensions.file_browser
		local fb_actions = fb.actions
		telescope.setup({
			extensions = {
				file_browser = {
					initial_mode = "normal",
					hijack_netrw = true,
					mappings = {
						["i"] = {
							["<C-a>"] = fb_actions.create,
							["<C-D>"] = fb_actions.remove,
						},
						["n"] = {
							["a"] = fb_actions.create,
							["d"] = fb_actions.remove,
							["u"] = fb_actions.goto_parent_dir,
							["r"] = fb_actions.rename,
							["m"] = fb_actions.move,
							["y"] = fb_actions.copy,
							["o"] = actions.select_default,
							["O"] = fb_actions.open,
							["j"] = actions.move_selection_next,
							["k"] = actions.move_selection_previous,
						},
					},
				},
			},
		})
		telescope.load_extension("file_browser")

		vim.keymap.set("n", "<space>fb", ":Telescope file_browser path=%:p:h select_buffer=true<CR>")
		vim.keymap.set("n", "<space>fr", fb.file_browser)
	end,
}
