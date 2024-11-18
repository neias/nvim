local M = {}

function M.toggle_theme_mode()
	if vim.o.background == "dark" then
		vim.o.background = "light"
		vim.cmd("colorscheme tokyonight-day")
		vim.cmd([[highlight Normal guibg=#ffffff guifg=#000000]])
	else
		vim.o.background = "dark"
		vim.cmd("colorscheme solarized-osaka")
	end
end

return M
