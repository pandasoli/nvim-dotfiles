return {
	{
		ft = {'javascriptreact', 'typescriptreact'},
		'maxmellon/vim-jsx-pretty'
	},

	{
		ft = 'svelte',
		'leafOfTree/vim-svelte-plugin'
	},

	{
		ft = 'html',
		'barrett-ruth/live-server.nvim',
		build = 'pnpm add -g live-server',
		cmd = { 'LiveServerStart', 'LiveServerStop' },
		config = true
	}
}
