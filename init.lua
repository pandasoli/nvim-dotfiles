require 'options'
require 'maps'
require 'config.tabline'

require 'plugin.lazy'.setup {
	{ import = 'plugin.cmp' },
	{ import = 'plugin.icon-picker' },
	{ import = 'plugin.lint' },

	{ import = 'plugin.core' },
	{ import = 'plugin.theme' },
	{ import = 'plugin.lsp' },
	{ import = 'plugin.gitsigns' },
	{ import = 'plugin.nekovim' },
	{ import = 'plugin.dap' },

	{ import = 'plugin.langs.md' },
	{ import = 'plugin.langs.java' },
	{ import = 'plugin.langs.webdev' },
	{ import = 'plugin.langs.haskell' }
}
