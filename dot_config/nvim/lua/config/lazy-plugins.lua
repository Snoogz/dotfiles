-- [[ Configure and intsll lazy plugins ]]
--
-- To check plugins
-- 	:Lazy
--
require("lazy").setup({
	-- NOTE:  Plugins can be add with a link or by short name ('owner/repo')y
	"tpope/vim-sleuth", -- Detect tabstop and shiftwidth automatically
	-- NOTE: Plugins can also be added modularly
	-- include a plugin definition from file `lua\path\name.lua`
	require("plugins/gruvbox"),
	require("plugins/which-key"),
	require("plugins/telescope"),
	require("plugins/todo-comments"),
	require("plugins/mini"),
	require("plugins/treesitter"),
	require("plugins/lspconfig"),
	require("plugins/cmp"),
	require("plugins/conform"),
	require("plugins/gitsigns"),
	require("plugins/neo-tree"),
	require("plugins/autopairs"),
	require("plugins/lazygit"),
	-- For additional information with loading, sourcing and examples see `:help lazy.nvim-🔌-plugin-spec`
	-- Or use telescope!
	-- In normal mode type `<space>sh` then write `lazy.nvim-plugin`
	-- you can continue same window with `<space>sr` which resumes last telescope search
}, {
	ui = {
		icons = vim.g.have_nerd_font and {} or {
			cmd = "⌘",
			config = "🛠",
			event = "📅",
			ft = "📂",
			init = "⚙",
			keys = "🗝",
			plugin = "🔌",
			runtime = "💻",
			require = "🌙",
			source = "📄",
			start = "🚀",
			task = "📌",
			lazy = "💤 ",
		},
	},
})

--vim: ts=2 sts=2 sw=2 et
