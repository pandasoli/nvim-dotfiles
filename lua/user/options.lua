local opts = {
	clipboard = 'unnamedplus',              -- allows neovim to access the system clipboard
	cmdheight = 1,                          -- less space in the neovim command line
	fileencoding = 'utf-8',                 -- the encoding written to a file
	hlsearch = true,                        -- highlight all matches on previous search pattern
	ignorecase = true,                      -- ignore case in search patterns
	pumheight = 10,                         -- pop up menu height
	showmode = false,                       -- we don't need to see things like -- INSERT -- anymore
	smartcase = true,                       -- smart case
	smartindent = true,                     -- make indenting smarter again
	splitbelow = true,                      -- force all horizontal splits to go below current window
	splitright = true,                      -- force all vertical splits to go to the right of current window
	timeoutlen = 1000,                      -- time to wait for a mapped sequence to complete (in milliseconds)
	undofile = true,                        -- enable persistent undo
	updatetime = 300,                       -- faster completion (4000ms default)
	shiftwidth = 2,                         -- the number of spaces inserted for each indentation
	tabstop = 2,                            -- insert 2 spaces for a tab
	wrap = false,                           -- display lines as one long line
	scrolloff = 8,                          -- is one of my fav
	sidescrolloff = 8,
	fillchars = { eob = ' ' },
	laststatus = 0
}

function set_opts()
	for opt, val in pairs(opts) do
		vim.opt[opt] = val
	end

	vim.opt.shortmess:append 'c'

	vim.cmd 'set whichwrap+=<,>,[,],h,l'
	vim.cmd 'set mouse='
	-- vim.cmd [[set iskeyword+=-]]
end

set_opts()
