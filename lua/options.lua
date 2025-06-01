vim = vim

local opts = {
	clipboard = 'unnamedplus',
	cmdheight = 1,
	laststatus = 0,
	fileencoding = 'utf-8',
	hlsearch = true,
	ignorecase = true,
	pumheight = 10,
	showmode = false,
	smartcase = true,
	smartindent = true,
	splitbelow = true,
	splitright = true,
	timeoutlen = 1000,
	undofile = true,
	updatetime = 300,
	shiftwidth = 2,
	tabstop = 2,
	wrap = false,
	scrolloff = 8,
	sidescrolloff = 8,
	fillchars = { eob = ' ' },
	exrc = true,
  cursorline = true,

	relativenumber = true,
  numberwidth = 6,
  statuscolumn = [[ %s%l %=%T ]] -- Middle relativenumber
}

local function set_clipboard()
	local uname = vim.loop.os_uname()

	if uname.sysname:find('Windows') then
		vim.g.clipboard = {
			name  = 'win_clipboard',
			copy  = { ['+'] = 'clip.exe',                     ['*'] = 'clip.exe'                     },
			paste = { ['+'] = 'powershell.exe Get-Clipboard', ['*'] = 'powershell.exe Get-Clipboard' },
			cache_enabled = 0
		}

		-- Are these really needed?
		vim.keymap.set({'n', 'v'}, 'y', '"+y', { noremap = true, silent = true })
		vim.keymap.set({'n', 'v'}, 'p', '"+p', { noremap = true, silent = true })
	elseif vim.fn.executable('waycopy') then
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
	vim.g.rust_recommended_style = 0
	vim.g.markdown_recommended_style = 0

	vim.o.whichwrap = vim.o.whichwrap .. '<,>,[,],h,l'
	vim.o.mouse = 'n'
	vim.opt.shortmess:append 'c'

	set_clipboard()

	vim.diagnostic.config({ virtual_text = true })
end

set_opts()
