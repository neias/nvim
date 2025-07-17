local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	spec = {
		-- add LazyVim and import its plugins
		{
			"LazyVim/LazyVim",
			import = "lazyvim.plugins",
			opts = {
				colorscheme = "solarized-osaka",
				news = {
					lazyvim = true,
					neovim = true,
				},
			},
		},
		-- import any extras modules here
		{ import = "lazyvim.plugins.extras.linting.eslint" },
		{ import = "lazyvim.plugins.extras.formatting.prettier" },
		{ import = "lazyvim.plugins.extras.lang.typescript" },
		{ import = "lazyvim.plugins.extras.lang.json" },
		-- { import = "lazyvim.plugins.extras.lang.markdown" },
		{ import = "lazyvim.plugins.extras.lang.rust" },
		{ import = "lazyvim.plugins.extras.lang.tailwind" },
		-- { import = "lazyvim.plugins.extras.ai.copilot" },
		-- { import = "lazyvim.plugins.extras.dap.core" },
		-- { import = "lazyvim.plugins.extras.vscode" },
		{ import = "lazyvim.plugins.extras.util.mini-hipatterns" },
		-- { import = "lazyvim.plugins.extras.test.core" },
		-- { import = "lazyvim.plugins.extras.coding.yanky" },
		-- { import = "lazyvim.plugins.extras.editor.mini-files" },
		-- { import = "lazyvim.plugins.extras.util.project" },
		{ -- ai plugin for codeium
			"Exafunction/codeium.nvim",
			dependencies = {
				"nvim-lua/plenary.nvim",
			},
			config = function()
				require("codeium").setup({
					enable_cmp_source = false,
					virtual_text = {
						enabled = true,

						-- These are the defaults

						-- Set to true if you never want completions to be shown automatically.
						manual = false,
						-- A mapping of filetype to true or false, to enable virtual text.
						filetypes = {},
						-- Whether to enable virtual text of not for filetypes not specifically listed above.
						default_filetype_enabled = true,
						-- How long to wait (in ms) before requesting completions after typing stops.
						idle_delay = 75,
						-- Priority of the virtual text. This usually ensures that the completions appear on top of
						-- other plugins that also add virtual text, such as LSP inlay hints, but can be modified if
						-- desired.
						virtual_text_priority = 65535,
						-- Set to false to disable all key bindings for managing completions.
						map_keys = true,
						-- The key to press when hitting the accept keybinding but no completion is showing.
						-- Defaults to \t normally or <c-n> when a popup is showing.
						accept_fallback = nil,
						-- Key bindings for managing completions in virtual text mode.
						key_bindings = {
							-- Accept the current completion.
							accept = "<Tab>",
							-- Accept the next word.
							accept_word = false,
							-- Accept the next line.
							accept_line = false,
							-- Clear the virtual text.
							clear = false,
							-- Cycle to the next completion.
							next = "<M-]>",
							-- Cycle to the previous completion.
							prev = "<M-[>",
						},
					},
				})
			end,
		},
		{ import = "plugins" },
	},
	defaults = {
		-- By default, only LazyVim plugins will be lazy-loaded. Your custom plugins will load during startup.
		-- If you know what you're doing, you can set this to `true` to have all your custom plugins lazy-loaded by default.
		lazy = false,
		-- It's recommended to leave version=false for now, since a lot the plugin that support versioning,
		-- have outdated releases, which may break your Neovim install.
		version = false, -- always use the latest git commit
		-- version = "*", -- try installing the latest stable version for plugins that support semver
	},
	dev = {
		path = "~/.ghq/github.com",
	},
	checker = { enabled = false, notify = false, frequency = 86400 }, -- automatically check for plugin updates
	performance = {
		cache = {
			enabled = true,
			-- disable_events = {},
		},
		rtp = {
			-- disable some rtp plugins
			disabled_plugins = {
				"gzip",
				-- "matchit",
				-- "matchparen",
				"netrwPlugin",
				"rplugin",
				"tarPlugin",
				"tohtml",
				"tutor",
				"zipPlugin",
			},
		},
	},
	ui = {
		custom_keys = {
			["<localleader>d"] = function(plugin)
				dd(plugin)
			end,
		},
	},
	debug = false,
})
