return {
	{
		"timofurrer/edelweiss",
		lazy = false, -- make sure we load this during startup, because it's the main colorscheme
		priority = 1000, -- make sure to load this before all the other start plugins
		config = function(plugin)
			vim.opt.rtp:append(plugin.dir .. "/nvim")
			vim.cmd([[colorscheme edelweiss]])
		end,
	},
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
	},
}
