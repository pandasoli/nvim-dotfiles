return {
	'alligator/accent.vim',

	config = function()
		vim.cmd [[
			let g:accent_colour = 'red'
			colorscheme accent
			hi Normal guibg=none
			hi NonText guibg=none
		]]
	end
}
