return {
	"folke/which-key.nvim",
	opts = {
		plugins = { spelling = true },
	},
	config = function()
		local wk = require("which-key")
		wk.register({
			["<leader>"] = {
				g = {
					name = "Git",
					d = { ":DiffviewOpen<CR>", "Open Diffview" },
					f = { ":DiffviewFileHistory<CR>", "File History" },
					c = { ":DiffviewClose<CR>", "Close Diffview" },
				},
				t = {
					name = "Theme",
					t = { "<cmd>lua require('config.theme').toggle_theme_mode()<cr>", "Toggle Light/Dark Mode" },
				},
			},
		})
	end,
}
