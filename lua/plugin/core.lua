return {
	{'windwp/nvim-autopairs', event = 'InsertEnter', opts = {}},
	{'numToStr/Comment.nvim', lazy = false}, -- easy comment
	'mg979/vim-visual-multi',                -- multiple cursors

	-- I put it in here after having some issues with lua & vimdoc language
	-- servers not being installed within the 'native treesitter'.
	-- This error happened after an update to nvim v0.10.0
	{
		'nvim-treesitter/nvim-treesitter',
		opts = {
			ensure_installed = {
				'c', 'lua', 'markdown', 'vimscript', 'vimdoc' -- defaults
			}
		}
	}
}

