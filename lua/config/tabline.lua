-- This was made by ChatGPT based on an older version I made myself.
-- If you need any help understanding this code ask the developer.

function CustomizedTabLine()
	local s = '%#TabLineIcon# 󰄛 %#TabLine#'
	local current = vim.fn.tabpagenr()
	local total_tabs = vim.fn.tabpagenr('$')

	local max_tabs = 5 -- Number of tabs to show at once

	local start_tab = math.max(1, current - math.floor(max_tabs / 2))
	local end_tab = math.min(total_tabs, start_tab + max_tabs - 1)

	if end_tab - start_tab + 1 < max_tabs then
		start_tab = math.max(1, end_tab - max_tabs + 1)
	end

	-- Add < or > indicators
	if start_tab > 1 then
		s = s .. '%#TabLineIcon# < %#TabLine#'
	end

	for i = start_tab, end_tab do
		local buflist = vim.fn.tabpagebuflist(i)
		local winnr = vim.fn.tabpagewinnr(i)

		s = s .. (i == current and '%#TabLineSel#' or '%#TabLine#')
		s = s .. ' '

		local file = vim.fn.bufname(buflist[winnr])
		file = vim.fn.fnamemodify(file, ':p:t')
		file = file ~= '' and file or '[No Name]'
		s = s .. file

		s = s .. ' '
	end

	if end_tab < total_tabs then
		s = s .. '%#TabLineIcon# > %#TabLine#'
	end

	s = s .. '%T%#TabLineFill#%='
	return s
end

vim.opt.stal = 1
vim.opt.tabline = '%!luaeval("CustomizedTabLine()")'

vim.cmd [[
	hi TabLine     ctermfg=8 ctermbg=none guifg=#414868 guibg=none
	hi TabLineFill           ctermbg=none guifg=none    guibg=none
	hi TabLineSel  ctermfg=1              guifg=#f7768e guibg=none
	hi TabLineIcon ctermfg=7              guifg=#a9b1d6
]]
