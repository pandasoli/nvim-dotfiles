
-- Remember cursor position
vim.api.nvim_create_autocmd('BufReadPost', {
	pattern = '*',
	callback = function()
		local pos = vim.fn.line("'\"")

		if pos > 1 and pos <= vim.fn.line('$') then
			vim.cmd('normal! g`"')
		end
	end
})
