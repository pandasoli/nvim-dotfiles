vim = vim

local opts = {
	clipboard = 'unnamedplus',              -- allows neovim to access the system clipboard
	cmdheight = 1,                          -- less space in the neovim command line
	fileencoding = 'utf-8',                 -- the encoding written to a file
	hlsearch = true,                        -- highlight all matches on previous search pattern
	ignorecase = true,                      -- ignore case in search patterns
	pumheight = 10,                         -- pop up menu height
	showmode = false,                       -- do not show the mode (-- INSERT --) anymore
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
	scrolloff = 8,                          -- lines away from the top/bottom to start scrolling
	sidescrolloff = 8,
	fillchars = { eob = ' ' },
	laststatus = 0
}

---@param c 'wsl'|'wayclip' -- The clipboard name or environment
local function set_clipboard(c)
	if c == 'wsl' then
		vim.g.clipboard = {
			name  = 'win_clipboard',
			copy  = { ['+'] = 'clip.exe',                     ['*'] = 'clip.exe'                     },
			paste = { ['+'] = 'powershell.exe Get-Clipboard', ['*'] = 'powershell.exe Get-Clipboard' },
			cache_enabled = 0
		}

		-- Are these really needed?
		vim.keymap.set({'n', 'v'}, 'y', '"+y', { noremap = true, silent = true })
		vim.keymap.set({'n', 'v'}, 'p', '"+p', { noremap = true, silent = true })
	elseif c == 'wayclip' then
		vim.g.clipboard = {
			name  = 'wayclip',
			copy  = { ['+'] = 'waycopy',  ['*'] = 'waycopy'  },
			paste = { ['+'] = 'waypaste', ['*'] = 'waypaste' },
			cache_enabled = 0
		}
	end
end

local function set_opts()
	for opt, val in pairs(opts) do
		vim.opt[opt] = val
	end

	vim.g.python_recommended_style = 0
	vim.g.markdown_recommended_style = 0

	vim.opt.shortmess:append 'c'

	vim.o.whichwrap = vim.o.whichwrap .. '<,>,[,],h,l'
	vim.o.mouse = 'n'
	-- vim.cmd [[set iskeyword+=-]]

	set_clipboard('wayclip')
end

set_opts()
