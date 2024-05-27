local lspconfig = require 'lspconfig'

local lsp_servers = {
	'clangd', -- C
	'lua_ls', -- Lua
	'gopls',  -- Go

	-- JavaScript -- 'jsonls', 'eslint'
	tsserver = {
		root_dir = lspconfig.util.root_pattern('package.json'),
		single_file_support = false
	},

	denols = {
		root_dir = lspconfig.util.root_pattern('deno.json', 'deno.jsonc')
	}
}

for server, config in pairs(lsp_servers) do
	if type(server) == 'number' then
		server = config
		config = {}
	end

	lspconfig[server].setup(config)
end
