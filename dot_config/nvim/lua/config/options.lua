-- [[ Setting Options ]]
-- See `:help vim.opt` or `:help option-list`

-- line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- mouse mode
vim.opt.mouse = "a"

-- no mode show
vim.opt.showmode = false

-- sync clipboard
vim.schedule(function()
	vim.opt.clipboard = "unnamedplus"
end)

-- break indent
vim.opt.breakindent = true

-- undo history
vim.opt.undofile = true

-- case sensitive searching
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- keep sign column on
vim.opt.signcolumn = "yes"

-- decrease update time
vim.opt.updatetime = 250

-- decrease mapped sequence wait time
vim.opt.timeoutlen = 300

-- how splits open
vim.opt.splitright = true
vim.opt.splitbelow = true

-- how to display certain whitespace characters
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- preview substitutions
vim.opt.inccommand = "split"

-- show cursor line
vim.opt.cursorline = true

-- min number of screen lines
vim.opt.scrolloff = 10

-- vim: ts=2 sts=2 sw=2 et
