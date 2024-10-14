return {
	'neovim/nvim-lspconfig',

	config = function()
		local lspconfig = require 'lspconfig'
		local lsputil = require 'lspconfig.util'

		local lsp_servers = {
			'clangd', -- C
			'lua_ls', -- Lua
			'gopls',  -- Go
			'pyright',

			ts_ls = {
				root_dir = lsputil.root_pattern('package.json'),
				single_file_support = false
			},

			denols = {
				root_dir = lsputil.root_pattern('deno.json', 'deno.jsonc')
			},

			svelte = {
				-- filetypes = { 'svelte' }, -- Maybe this works better? https://github.com/neovim/neovim/issues/12688
				default_config = {
					cmd = { 'svelteserver', '--stdio' },
					filetypes = { 'svelte' },
					root_dir = lsputil.root_pattern('package.json', '.git')
				},
				docs = {
					default_config = {
						root_dir = [[root_pattern("package.json", ".git")]]
					}
				}
			}
		}

		for server, config in pairs(lsp_servers) do
			if type(server) == 'number'
			and type(config) == 'string' then
				server = config
				config = {}
			end

			lspconfig[server].setup(config)
		end
	end
}
