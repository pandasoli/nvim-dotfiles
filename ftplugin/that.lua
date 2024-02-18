vim.cmd [[
	function! GetBytePosition()
		" Get EOL character size
		" DOS files end with CRLF (\r\n)
		let eol = &fileformat == 'dos' ? 2 : 1

		let lines = getline(1, '$')
		let row = line('.')
		let col = col('.')
		let pos = 0

		for i in range(0, row - 2)
			let pos += len(lines[i]) + eol
		endfor

		let pos += col

		return pos
	endfunction

	function! SetBytePosition(pos)
		" Get EOL character size
		" DOS files end with CRLF (\r\n)
		let eol = &fileformat == 'dos' ? 2 : 1

		" Find positions
		let lines = getline(1, '$')
		let row = 1
		let col = 1
		let last = 1

		for line in lines
			if last + len(line) > a:pos
				let col = a:pos - last + 1
				let col = col == 0 ? 1 : col
				break
			endif

			let last += len(line) + eol
			let row += 1
		endfor

		" Set Positions
		call cursor(row, col)
	endfunction

	command! -nargs=1 SetBytePosition call SetBytePosition(<f-args>)
	command! Pos echo GetBytePosition()
]]
