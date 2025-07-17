-- local discipline = require("craftzdog.discipline")
-- discipline.cowboy()

local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- Do things without affecting the registers
keymap.set("n", "x", '"_x')
keymap.set("n", "<Leader>p", '"0p')
keymap.set("n", "<Leader>P", '"0P')
keymap.set("v", "<Leader>p", '"0p')
keymap.set("n", "<Leader>c", '"_c')
keymap.set("n", "<Leader>C", '"_C')
keymap.set("v", "<Leader>c", '"_c')
keymap.set("v", "<Leader>C", '"_C')
keymap.set("n", "<Leader>d", '"_d')
keymap.set("n", "<Leader>D", '"_D')
keymap.set("v", "<Leader>d", '"_d')
keymap.set("v", "<Leader>D", '"_D')

-- Add a blank line after current line
keymap.set("n", "O", "O<Esc>")
keymap.set("n", "o", "o<Esc>")
keymap.set("n", "<Leader>o", "o", opts)
keymap.set("n", "<Leader>O", "O", opts)

-- Increment/decrement
keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")

-- Delete a word backwards
keymap.set("n", "dw", 'vb"_d')

-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G")

-- Save with root permission (not working for now)
--vim.api.nvim_create_user_command('W', 'w !sudo tee > /dev/null %', {})

-- Jumplist
keymap.set("n", "<C-m>", "<C-i>", opts)

-- New tab
keymap.set("n", "te", ":tabedit")
keymap.set("n", "<tab>", ":tabnext<Return>", opts)
keymap.set("n", "<s-tab>", ":tabprev<Return>", opts)
-- Split window
keymap.set("n", "ss", ":split<Return>", opts)
keymap.set("n", "sv", ":vsplit<Return>", opts)
-- Move window
keymap.set("n", "sh", "<C-w>h")
keymap.set("n", "sk", "<C-w>k")
keymap.set("n", "sj", "<C-w>j")
keymap.set("n", "sl", "<C-w>l")

-- Resize window
keymap.set("n", "<C-w><left>", "<C-w><")
keymap.set("n", "<C-w><right>", "<C-w>>")
keymap.set("n", "<C-w><up>", "<C-w>+")
keymap.set("n", "<C-w><down>", "<C-w>-")

-- Diagnostics
keymap.set("n", "<C-j>", function()
	vim.diagnostic.goto_next()
end, opts)

-- keymap.set("n", "<leader>h", function()
-- 	require("craftzdog.hsl").replaceHexWithHSL()
-- end)

keymap.set("n", "<leader>i", function()
	require("craftzdog.lsp").toggleInlayHints()
end)

-- git diffview (override LazyVim defaults)
keymap.set("n", "<leader>gd", "<cmd>DiffviewOpen<cr>", { desc = "Open Diffview" })
keymap.set("n", "<leader>gc", "<cmd>DiffviewClose<cr>", { desc = "Close Diffview" })
keymap.set("n", "<leader>gF", "<cmd>DiffviewFileHistory<cr>", { desc = "Diffview File History" })
keymap.set("n", "<leader>gq", "<cmd>DiffviewClose<cr>", { desc = "Quit Diffview" })
keymap.set("n", "<leader>gC", function()
	require("telescope.builtin").git_bcommits()
end, { desc = "Git commits (current buffer)" })

-- neo-tree
keymap.set("n", "<leader>n", ":Neotree focus<CR>", opts)

-- theme
local theme = require("config.theme")
vim.keymap.set("n", "<leader>tt", theme.toggle_theme_mode, { desc = "Toggle Light/Dark Mode" })

--oldfile
keymap.set("n", "<leader>r", function()
	require("fzf-lua").oldfiles()
end, { desc = "FzfLua: Recent Files" })

-- Go to definition in new tab
keymap.set("n", "gtd", function()
	local params = vim.lsp.util.make_position_params()
	vim.lsp.buf_request(0, "textDocument/definition", params, function(err, result, ctx, config)
		if err then
			vim.notify("Error: " .. err.message)
			return
		end
		if not result or vim.tbl_isempty(result) then
			vim.notify("No definition found")
			return
		end
		
		-- Get the first result
		local definition = result[1] or result
		local uri = definition.uri or definition.targetUri
		local range = definition.range or definition.targetRange
		
		-- Open in new tab
		vim.cmd("tabnew")
		vim.lsp.util.jump_to_location(definition, "utf-8")
	end)
end, { desc = "Go to definition in new tab" })
