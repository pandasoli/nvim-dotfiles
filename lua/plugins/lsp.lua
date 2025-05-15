return {
	'neovim/nvim-lspconfig',

	config = function()
		local lspconfig = require 'lspconfig'
		local lsputil = require 'lspconfig.util'

		local servers = {
			'clangd', -- C
			'lua_ls', -- Lua
			'gopls',  -- Go
			'pyright',
			'csharp_ls',

			ts_ls = {
				single_file_support = false,
				root_dir = lsputil.root_pattern 'package.json'
			},
			denols = {
				root_dir = lsputil.root_pattern('deno.json', 'deno.jsonc')
			},

			svelte = {
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

		for server, config in pairs(servers) do
			if type(server) == 'number' and type(config) == 'string' then
				server = config
				config = {}
			end

			lspconfig[server].setup(config)
		end
	end
}
