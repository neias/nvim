return {
	"folke/which-key.nvim",
	opts = {
		plugins = { spelling = true },
	},
	config = function()
		local wk = require("which-key")
		wk.add({
			{ "<leader>g", group = "Git" },
			{ "<leader>gd", "<cmd>DiffviewOpen<CR>", desc = "Open Diffview" },
			{ "<leader>gF", "<cmd>DiffviewFileHistory<CR>", desc = "Diffview File History" },
			{ "<leader>gc", "<cmd>DiffviewClose<CR>", desc = "Close Diffview" },
			{ "<leader>gq", "<cmd>DiffviewClose<CR>", desc = "Quit Diffview" },
			{ "<leader>gC", function() require("telescope.builtin").git_bcommits() end, desc = "Git Commits (Buffer)" },
			{ "<leader>t", group = "Theme" },
			{ "<leader>tt", "<cmd>lua require('config.theme').toggle_theme_mode()<cr>", desc = "Toggle Light/Dark Mode" },
		})
	end,
}
