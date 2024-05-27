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
			},
		})
	end,
}
