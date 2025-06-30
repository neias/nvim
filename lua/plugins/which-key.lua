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
					d = { "<cmd>DiffviewOpen<CR>", "Open Diffview" },
					F = { "<cmd>DiffviewFileHistory<CR>", "Diffview File History" },
					c = { "<cmd>DiffviewClose<CR>", "Close Diffview" },
					q = { "<cmd>DiffviewClose<CR>", "Quit Diffview" },
					C = { function() require("telescope.builtin").git_bcommits() end, "Git Commits (Buffer)" },
				},
				t = {
					name = "Theme",
					t = { "<cmd>lua require('config.theme').toggle_theme_mode()<cr>", "Toggle Light/Dark Mode" },
				},
			},
		})
	end,
}
