-- Define the function to generate the custom tabline
function CustomizedTabLine()
	local s = ''
	local t = vim.fn.tabpagenr()
	local i = 1

	while i <= vim.fn.tabpagenr('$') do
		local buflist = vim.fn.tabpagebuflist(i)
		local winnr = vim.fn.tabpagewinnr(i)

		s = s .. (i == t and '%#TabLineSel#' or '%#TabLine#')
		s = s .. ' '

		local file = vim.fn.bufname(buflist[winnr])
		file = vim.fn.fnamemodify(file, ':p:t')
		file = file ~= '' and file or '[No Name]'
		s = s .. file

		s = s .. ' '
		i = i + 1
	end

	s = s .. '%T%#TabLineFill#%='
	return s
end

vim.opt.stal = 1
vim.opt.tabline = '%!luaeval("CustomizedTabLine()")'

vim.cmd [[
	hi TabLineFill guifg=none guibg=none
	hi TabLine guifg=#2b3042 guibg=none
	hi TabLineSel gui=none guifg=#90b3f4 guibg=#1c1f26
]]
