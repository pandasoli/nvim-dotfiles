-- https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation#javascript

return {
	'mfussenegger/nvim-dap',

	dependencies = {
		'theHamsta/nvim-dap-virtual-text',
		dependencies = {
			'nvim-treesitter/nvim-treesitter',
			opts = {ensure_installed = 'javascript'}
		}
	},

	config = function()
		require 'dap'.configurations.javascript = {
			{
				type = 'pwa-node',
				request = 'launch',
				name = 'Launch file',
				program = '${file}',
				cwd = '${workspaceFolder}',
			}
		}

		require 'dap'.adapters['pwa-node'] = {
			type = 'server',
			host = 'localhost',
			port = '${port}',
			executable = {
				command = 'node',
				-- 💀 Make sure to update this path to point to your installation
				args = {'/home/panda/Downloads/js-debug/src/dapDebugServer.js', '${port}'},
			}
		}

		require 'nvim-dap-virtual-text'.setup()
	end
}
