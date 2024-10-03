local M = {}

function M.toggle_theme_mode()
	if vim.o.background == "dark" then
		vim.o.background = "light"
		vim.cmd("colorscheme github_light")
	else
		vim.o.background = "dark"
		vim.cmd("colorscheme github_dark")
	end
end

return M
