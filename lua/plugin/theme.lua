return {
	{ enabled = false, 'daschw/leaf.nvim', commit = 'd7e3506' },
	{
		enabled = false,
		'shaunsingh/nord.nvim',

		config = function()
			-- vim.cmd [[
			-- 	colorscheme nord
			-- 	hi Normal guibg=none
			-- 	hi NonText guibg=none
			-- ]]

			vim.g.nord_contrast = true
			vim.g.nord_borders = false
			vim.g.nord_disable_background = true
			vim.g.nord_italic = false
			vim.g.nord_uniform_diff_background = true
			vim.g.nord_bold = false
			require 'nord'.set()
		end
	},

	{
		'alligator/accent.vim',

		config = function()
			vim.cmd [[
				let g:accent_colour = 'blue'
			 	colorscheme accent
				hi Normal guibg=none
			 	hi NonText guibg=none
			]]
		end
	}
}
