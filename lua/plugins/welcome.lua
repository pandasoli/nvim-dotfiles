
local function align(text)
	local w = 40
	return text .. string.rep(' ', w - #text)
end

return {
	'nvimdev/dashboard-nvim',
	event = 'VimEnter',
	dependencies = { 'nvim-tree/nvim-web-devicons' },

	opts = {
		theme = 'doom',
		config = {
			header = {
				[[                                   ]],
				[[                                   ]],
				[[                                   ]],
				[[  ▐ ▄ ▄▄▄ .       ▌ ▐·▪  • ▌ ▄ ·.  ]],
				[[ •█▌▐█▀▄.▀·▪     ▪█·█▌██ ·██ ▐███▪ ]],
				[[ ▐█▐▐▌▐▀▀▪▄ ▄█▀▄ ▐█▐█•▐█·▐█ ▌▐▌▐█· ]],
				[[ ██▐█▌▐█▄▄▌▐█▌.▐▌ ███ ▐█▌██ ██▌▐█▌ ]],
				[[ ▀▀ █▪ ▀▀▀  ▀█▄▀▪. ▀  ▀▀▀▀▀  █▪▀▀▀ ]],
				[[                                   ]]
			},
			center = {
				{
					icon = '󰻭 ',
					icon_hl = 'Title',
					desc = align('New file'),
					desc_hl = 'String',
					key = 'n',
					keymap = '',
					key_hl = 'Number',
					key_format = ' %s',
					action = 'ene | startinsert'
				},
				{
					icon = ' ',
					icon_hl = 'Title',
					desc = align('Find file'),
					desc_hl = 'String',
					key = 'e',
					keymap = '',
					key_hl = 'Number',
					key_format = ' %s',
					action = 'Telescope find_files'
				},
				{
					icon = ' ',
					icon_hl = 'Title',
					desc = align('Recent files'),
					desc_hl = 'String',
					key = 'r',
					keymap = '',
					key_hl = 'Number',
					key_format = ' %s',
					action = 'Telescope oldfiles'
				},
				{
					icon = ' ',
					icon_hl = 'Title',
					desc = align('Config'),
					desc_hl = 'String',
					key = 'c',
					keymap = '',
					key_hl = 'Number',
					key_format = ' %s',
					action = 'lua require("telescope.builtin").find_files({ cwd = "~/.config/nvim" })'  -- Neovim config
				},
				{
					icon = '󰒲 ',
					icon_hl = 'Title',
					desc = align('Lazy'),
					desc_hl = 'String',
					key = 'l',
					keymap = '',
					key_hl = 'Number',
					key_format = ' %s',
					action = 'Lazy'
				},
				{
					icon = ' ',
					icon_hl = 'Title',
					desc = align('Quit'),
					desc_hl = 'String',
					key = 'q',
					keymap = '',
					key_hl = 'Number',
					key_format = ' %s',
					action = 'qa'
				},
			},
			footer = function()
				local stats = require 'lazy'.stats()
				local ms = math.floor(stats.startuptime * 100 + 0.5) / 100
				return { ' ' .. stats.loaded .. ' of ' .. stats.count .. ' plugins loaded in ' .. ms .. 'ms' }
			end
		}
	}
}
