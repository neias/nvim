-- Turn off paste mode when leaving insert
vim.api.nvim_create_autocmd("InsertLeave", {
	pattern = "*",
	command = "set nopaste",
})

-- Disable the concealing in some file formats
-- The default conceallevel is 3 in LazyVim
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "json", "jsonc", "markdown" },
	callback = function()
		vim.opt.conceallevel = 0
	end,
})

-- Markdown-specific keymaps
vim.api.nvim_create_autocmd("FileType", {
	pattern = "markdown",
	callback = function()
		local bufnr = vim.api.nvim_get_current_buf()

		-- Toggle markdown checkbox
		vim.keymap.set("n", "<leader>x", function()
			local line = vim.api.nvim_get_current_line()
			local new_line = line

			-- Check if line contains an unchecked checkbox
			if line:match("%[%s%]") then
				new_line = line:gsub("%[%s%]", "[x]", 1)
			-- Check if line contains a checked checkbox
			elseif line:match("%[x%]") or line:match("%[X%]") then
				new_line = line:gsub("%[x%]", "[ ]", 1):gsub("%[X%]", "[ ]", 1)
			end

			-- Update the line if it changed
			if new_line ~= line then
				vim.api.nvim_set_current_line(new_line)
			end
		end, { buffer = bufnr, desc = "Toggle markdown checkbox" })

		-- Insert new checkbox item
		vim.keymap.set("n", "<leader>-", function()
			local line = vim.api.nvim_get_current_line()
			local indent = line:match("^%s*") or ""
			vim.api.nvim_put({ indent .. "- [ ] " }, "l", true, true)
			vim.cmd("startinsert!")
		end, { buffer = bufnr, desc = "New checkbox item" })
	end,
})
