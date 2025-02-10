-- [[ Setting Keymaps ]]
-- See `:help vim.keymap.set()`

-- Clear highlights with <ESC>
-- See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Quick exit
-- NOTE: may not work everywhere
-- Use `<C-\><C-n>` to exit
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TODO: disable arrow keys in normal mode
-- TODO: split navigation

-- [[ Base Autocommands ]]
-- `:help lua-guide-autocommands`

-- Highlight when yanking <yap>
vim.api.nvim_create_autocmd('TextYankPost', {
	desc = 'Highlight when yanking (copying) text',
	group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})
