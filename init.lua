require 'options'
require 'maps'
require 'config.tabline'
require 'config.cursor'

require 'plugins.lazy'.setup {
	{ import = 'plugins.cmp' },
	{ import = 'plugins.icon-picker' },
	-- { import = 'plugins.lint' }, -- Is this really necessary?
	{ import = 'plugins.normal-cmdline' },
	{ import = 'plugins.welcome' },

	{ import = 'plugins.core' },
	{ import = 'plugins.theme' },
	{ import = 'plugins.lsp' },
	{ import = 'plugins.gitsigns' },
	-- { import = 'plugins.nekovim' },
	-- { import = 'plugins.dap' }, -- Is this really necessary?

	-- { import = 'plugins.langs.md' },
	-- { import = 'plugins.langs.java' },
	-- { import = 'plugins.langs.html' },
	-- { import = 'plugins.langs.jsx' },
	-- { import = 'plugins.langs.haskell' },
	{ import = 'plugins.langs.svelte' },
	{ import = 'plugins.langs.algol68' }
}
