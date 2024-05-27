local keymap = vim.keymap.set

keymap('n', '<F2>', '', {
	noremap = true,

	silent = true,
	callback = require 'scripts.auto-rename-tag'
})
