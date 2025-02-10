-- Pull in the wezterm API
local wezterm = require("wezterm")
local mux = wezterm.mux
local act = wezterm.action

local config = {}
local key_mappings = {}
local mouse_bindings = {}
local launch_menu = {}

-- This will hold the configuration.
if wezterm.config_builder() then
	config = wezterm.config_builder()
end

config.disable_default_key_bindings = true
key_mappings = {
	{ key = "w", mods = "SHIFT|CTRL", action = act.CloseCurrentTab({confirm = true}) },
	{ key = "Copy", mods = "NONE", action = act.CopyTo("Clipboard") },
	{ key = "Paste", mods = "NONE", action = act.PasteFrom("Clipboard") },
}

mouse_bindings = {
	{
		event = { Up = { streak = 1, button = 'Left' } },
		mods = 'NONE',
		action = act.CompleteSelection("ClipboardAndPrimarySelection")
	},
	{
		event = { Up = { streak = 1, button = 'Left' } },
		mods = 'CTRL',
		action = act.OpenLinkAtMouseCursor
	},
	{
		event = { Down = { streak = 3, button = 'Left' } },
		action = wezterm.action.SelectTextAtMouseCursor 'SemanticZone',
		mods = 'NONE'
	}
}

config.default_prog = { "pwsh.exe", "-NoLogo" }
launch_menu = {
	{
		label = "PowerShell",
		args = { "powershell", "-NoLogo" }
	},
	{
		label = "Pwsh",
		args = { "pwsh.exe", "-NoLogo" }
	}
}

-- This is where you actually apply your config choices
config.font = wezterm.font("DaddyTimeMono Nerd Font Mono")
config.font_size = 12.0

-- For example, changing the color scheme:
config.color_scheme = "Gruvbox Dark (Gogh)"
config.default_cursor_style = 'BlinkingBar'
config.initial_cols = 80
config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = false
config.window_decorations = "RESIZE"
config.launch_menu = launch_menu
config.keys = key_mappings
config.mouse_bindings = mouse_bindings

-- and finally, return the configuration to wezterm
return config
