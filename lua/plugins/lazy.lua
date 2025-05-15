local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'

if not vim.loop.fs_stat(lazypath) then
	vim.fn.system {
		'git',
		'clone',
		'--filter=blob:none',
		'--depth=1',
		'https://github.com/folke/lazy.nvim',
		'--branch=stable',
		lazypath
	}
end

vim.opt.rtp:prepend(lazypath)

return require 'lazy'
