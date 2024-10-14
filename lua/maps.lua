local opts = { noremap = true, silent = true }
local helper_opts = { noremap = true }

-- Shorten functions
local keymap = vim.keymap.set

-- Remap space as leader key
keymap('', '<Space>', '<Nop', opts)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Modes
--   normal_mode = n
--   insert_mode = i
--   visual_mode = v
--   visual_block_mode = x
--   term_mode = t
--   command_mode = c

keymap('n', '!', '<cmd>noh<CR>', opts)
keymap('n', '<leader>r', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)

keymap('n', 'e', ':tabedit<space>', helper_opts)
keymap('n', '<Tab>', '<cmd>tabnext<CR>', opts)
keymap('n', '<S-Tab>', '<cmd>tabprevious<CR>', opts)

keymap('n', 'gw', '<cmd>normal gx<CR>', opts)
keymap('n', 'gf', '<cmd>tabedit <cfile><CR>', opts)

keymap('n', '<leader>p', '<cmd>Gitsigns preview_hunk<CR>', opts)
