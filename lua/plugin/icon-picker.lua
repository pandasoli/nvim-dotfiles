return {
	'ziontee113/icon-picker.nvim',
	opts = { disable_legacy_commands = true },
	dependencies = {
		'nvim-lua/plenary.nvim',
		'nvim-telescope/telescope.nvim',
		'stevearc/dressing.nvim'
	},

	config = function()
		require 'dressing'.setup {
			input = { enabled = false }
		}

		local options = {
			active = true,
			on_config_done = nil,
			theme = 'dropdown',

			defaults = {
				prompt_prefix = ' ',
				selection_caret = ' ',
				entry_prefix = '  ',
				initial_mode = 'insert',
				selection_strategy = 'reset',

				sorting_strategy = nil,
				layout_strategy = nil,
				layout_config = {},

				vimgrep_arguments = {
					'rg',
					'--color=never',
					'--no-heading',
					'--with-filename',
					'--line-number',
					'--column',
					'--smart-case',
					'--hidden',
					'--glob=!.git/'
				},

				file_ignore_patterns = {},
				path_display = { 'smart' },
				winblend = 0,
				border = {},
				borderchars = nil,
				color_devicons = true,
				set_env = { ['COLORTERM'] = 'truecolor' }
			},
			pickers = {
				find_files = { hidden = true },
				live_grep = { only_sort_text = true }, --@usage don't include the filename in the search results
				grep_string = { only_sort_text = true },
				buffers = { initial_mode = 'normal' },
				planets = {
					show_pluto = true,
					show_moon = true
				},
				git_files = {
					hidden = true,
					show_untracked = true
				},
				colorscheme = { enable_preview = true }
			}
		}

		local theme = require 'telescope.themes'['get_' .. (options.theme or '')]
		if theme then
			options.defaults = theme(options.defaults)
		end

		require 'telescope'.setup(options)
		require 'icon-picker'.setup { disable_legacy_commands = true }
	end
}
