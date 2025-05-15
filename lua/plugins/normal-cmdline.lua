return {
	'jake-stewart/normal-cmdline.nvim',
	event = 'CmdlineEnter',

	config = function()
		vim.opt.guicursor:append 'ci:ver1,c:ver1'

		local cmd = require 'normal-cmdline'

		cmd.setup {
			key = '<esc>',
			hl = 'Normal',
			mappings = {
				['k'] = cmd.history.prev,
				['j'] = cmd.history.next,
				['<cr>'] = cmd.accept,
				['<esc>'] = cmd.cancel,
				['<c-c>'] = cmd.cancel,
				[':'] = cmd.reset
			}
		}
	end
}
