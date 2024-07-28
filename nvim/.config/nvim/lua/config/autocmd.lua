vim.api.nvim_create_autocmd({ "InsertLeave" }, {
	callback = function()
		vim.fn.execute("silent! write")
		vim.notify("Autosaved!", vim.log.levels.INFO, {})
	end,
})
vim.api.nvim_create_autocmd("FileType", {
	pattern = "c",
	callback = function()
		-- -fsanitize=address -fsanitize=undefined -D_GLIBCXX_DEBUG
		vim.api.nvim_buf_set_keymap(
			0,
			"n",
			"<leader>r",
			-- "<ESC>:w<CR>:split<CR>:te gcc -std=c11 -Wshadow -Wall -o .%:t:r.out % -g  && time ./.%:t:r.out;read<CR>",
			"<ESC>:w<CR>:!gcc % && ./a.out<CR>",
			{ silent = true, noremap = true }
		)
	end,
})
vim.api.nvim_create_autocmd("FileType", {
	pattern = "cpp",
	callback = function()
		-- -fsanitize=address -fsanitize=undefined -D_GLIBCXX_DEBUG
		vim.api.nvim_buf_set_keymap(
			0,
			"n",
			"<leader>r",
			"<ESC>:w<CR>:!g++ % && ./a.out<CR>",
			{ silent = true, noremap = true }
		)
	end,
})
vim.api.nvim_create_autocmd("FileType", {
	pattern = "python",
	callback = function()
		-- -fsanitize=address -fsanitize=undefined -D_GLIBCXX_DEBUG
		vim.api.nvim_buf_set_keymap(
			0,
			"n",
			"<leader>r",
			"<ESC>:!python3 %<CR>",
			{ silent = true, noremap = true }
		)
	end,
})
