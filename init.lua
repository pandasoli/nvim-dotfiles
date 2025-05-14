require 'options'
require 'maps'
require 'config.tabline'

-- Script at /usr/share/nvim/runtime/syntax/algol68.vim
vim.cmd [[
	au BufNewFile,BufRead *.a68 setf algol68
]]

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

require 'plugin.lazy'.setup {
	{ import = 'plugin.cmp' },
	{ import = 'plugin.icon-picker' },
	{ import = 'plugin.lint' },
	{ import = 'plugin.normal-cmdline' },
	{ import = 'plugin.welcome' },

	{ import = 'plugin.core' },
	{ import = 'plugin.theme' },
	{ import = 'plugin.lsp' },
	{ import = 'plugin.gitsigns' },
	-- { import = 'plugin.nekovim' },
	{ import = 'plugin.dap' },

	{ import = 'plugin.langs.md' },
	-- { import = 'plugin.langs.java' },
	{ import = 'plugin.langs.webdev' },
	-- { import = 'plugin.langs.haskell' }
}
