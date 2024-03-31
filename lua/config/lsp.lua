local lspconfig = require 'lspconfig'

local lsp_servers = {
	'clangd', -- C
	'lua_ls', -- Lua
	'gopls',  -- Go

	-- JavaScript
	'tsserver', -- 'jsonls', 'eslint'
}

for _, server in pairs(lsp_servers) do
	lspconfig[server].setup {}
end
