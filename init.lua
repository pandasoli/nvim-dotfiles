require 'user.lazy'.setup {
	{'windwp/nvim-autopairs', event = 'InsertEnter', opts = {}},
	{'numToStr/Comment.nvim', opts = {}, lazy = false},   -- Easy comment
	'mg979/vim-visual-multi',   -- multiple cursors
	'lewis6991/gitsigns.nvim',  -- git status on colsign
	'pandasoli/nekovim',        -- Discord activity

	-- Theming
	'shaunsingh/nord.nvim',
	'daschw/leaf.nvim',

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

	'neovim/nvim-lspconfig',	

	-- Markdown
	'iamcco/markdown-preview.nvim',

	-- Java
	'mfussenegger/nvim-jdtls',
	'onsails/lspkind.nvim'
}

vim.cmd [[
	colorscheme leaf
	hi Normal guibg=none
	hi NonText guibg=none
]]

require 'user.options'
require 'user.keymaps'
require 'user.cmp'
require 'user.telescope'
require 'user.lsp'
require 'user.tabline'

require 'gitsigns'.setup {
	signs = {
		add = { text = '▏' },
		change = { text = '▏' }
	}
}

require 'dressing'.setup {
	input = { enabled = false }
}
