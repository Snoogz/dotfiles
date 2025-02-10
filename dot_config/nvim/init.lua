-- Set <space> as the leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.g.have_nerd_font = true

-- [[ Setting Options ]]
require("config.options")

-- [[ Setting Keymaps ]]
require("config.keymaps")

-- [[ Install `layz.nvim` ]]
require("config.lazy-bootstrap")

-- [[ Plugin configuration ]]
require("config.lazy-plugins")

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
