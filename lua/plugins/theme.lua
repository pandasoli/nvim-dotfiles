return {
	'alligator/accent.vim',

	config = function()
		vim.cmd [[
			let g:accent_colour = 'red'
			colorscheme accent

			hi LineNr       ctermfg=8   guifg=#414868
			hi CursorLineNr ctermfg=1   guifg=#f7768e
			hi CursorLine   ctermbg=235 guibg=#15161e

			hi Normal  guibg=none ctermbg=none
			hi NonText guibg=none ctermbg=none
		]]
	end
}
