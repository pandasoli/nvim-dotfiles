return {
	'ziontee113/icon-picker.nvim',

	dependencies = {
		'nvim-lua/plenary.nvim',
		'nvim-telescope/telescope.nvim',
		'stevearc/dressing.nvim'
	},

	config = function()
		require 'dressing'.setup {
			input = { enabled = false }
		}

		require 'icon-picker'.setup { disable_legacy_commands = true }
	end
}
