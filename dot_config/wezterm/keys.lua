local wezterm = require("wezterm")
local act = wezterm.action
local M = {}

function M.setup(config)
	config.disable_default_key_bindings = true
	config.keys = {
		{ key = "w", mods = "SHIFT|CTRL", action = act.CloseCurrentTab({ confirm = true }) },
		{ key = "t", mods = "SHIFT|CTRL", action = act.ShowLauncher },
		{ key = "-", mods = "SHIFT|CTRL", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
		{ key = "\\", mods = "SHIFT|CTRL", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
		{ key = "Copy", mods = "NONE", action = act.CopyTo("Clipboard") },
		{ key = "c", mods = "CTRL", action = act.CopyTo("Clipboard") },
		{ key = "Paste", mods = "NONE", action = act.PasteFrom("Clipboard") },
		{ key = "p", mods = "CTRL", action = act.PasteFrom("Clipboard") },
	}
end
return M
