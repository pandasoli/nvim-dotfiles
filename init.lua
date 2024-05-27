require 'plugin.lazy'.setup {
	{'windwp/nvim-autopairs', event = 'InsertEnter', opts = {}},
	{'numToStr/Comment.nvim', opts = {}, lazy = false},   -- Easy comment
	'mg979/vim-visual-multi',   -- multiple cursors
	'lewis6991/gitsigns.nvim',  -- git status on colsign
	'pandasoli/nekovim',        -- Discord activity

	'neovim/nvim-lspconfig',

	-- Theming
	'shaunsingh/nord.nvim',
	{'daschw/leaf.nvim', commit = 'd7e3506'},

	-- Emoji insertion
	{
		'ziontee113/icon-picker.nvim',
		opts = {disable_legacy_commands = true},
		dependencies = {
			'nvim-lua/plenary.nvim',
			'nvim-telescope/telescope.nvim',
			'stevearc/dressing.nvim'
		}
	},

	-- Auto completing
	'hrsh7th/nvim-cmp',
	'hrsh7th/cmp-buffer',
	'hrsh7th/cmp-path',
	'hrsh7th/cmp-nvim-lsp',
	'hrsh7th/cmp-nvim-lua',

	'hrsh7th/cmp-vsnip',
	'hrsh7th/vim-vsnip',

	-- Markdown
	'iamcco/markdown-preview.nvim',

	-- Java
	'mfussenegger/nvim-jdtls',
	'onsails/lspkind.nvim',

	-- Web dev
	'maxmellon/vim-jsx-pretty',

	{
		'barrett-ruth/live-server.nvim',
		build = 'pnpm add -g live-server',
		cmd = { 'LiveServerStart', 'LiveServerStop' },
		config = true
	}
}

require 'options'
require 'maps'
require 'plugin.cmp'
require 'plugin.telescope'
require 'config.lsp'
require 'config.tabline'

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

require 'gitsigns'.setup {
	signs = {
		add = { text = '▏' },
		change = { text = '▏' }
	}
}

require 'dressing'.setup {
	input = { enabled = false }
}

require 'nekovim'.setup {}

require 'live-server'.setup {}
