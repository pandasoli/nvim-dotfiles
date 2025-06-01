require 'options'
require 'maps'
require 'config.cursor'

require 'plugins.lazy'.setup {
	{ import = 'plugins.core' },
	{ import = 'plugins.cmp' },
	{ import = 'plugins.gitsigns' },
	{ import = 'plugins.lsp' },
	{ import = 'plugins.welcome' },
	{ import = 'plugins.theme' },
	{ import = 'plugins.normal-cmdline' },
	{ import = 'plugins.icon-picker' },
	{ import = 'plugins.hardtime' },
	-- { import = 'plugins.nekovim' },

	-- { import = 'plugins.langs.md' },
	-- { import = 'plugins.langs.java' },
	-- { import = 'plugins.langs.html' },
	-- { import = 'plugins.langs.jsx' },
	-- { import = 'plugins.langs.haskell' },
	{ import = 'plugins.langs.svelte' },
	{ import = 'plugins.langs.algol68' }
}

require 'config.tabline'
