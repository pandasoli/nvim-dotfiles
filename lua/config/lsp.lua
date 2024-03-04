local lspconfig = require 'lspconfig'

local lsp_servers = {
	-- C
	'clangd',

	-- JavaScript
	'tsserver', -- 'jsonls', 'eslint'
}

for _, server in pairs(lsp_servers) do
	lspconfig[server].setup {}
end
