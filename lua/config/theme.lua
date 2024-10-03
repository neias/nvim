local M = {}

function M.toggle_theme_mode()
	if vim.o.background == "dark" then
		vim.o.background = "light"
		vim.cmd("colorscheme edelweiss")
	else
		vim.o.background = "dark"
		vim.cmd("colorscheme tokyonight-storm")
	end
end

return M
