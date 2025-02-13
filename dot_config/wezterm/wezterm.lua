-- Pull in the wezterm API
local wezterm = require("wezterm")
--local mux = wezterm.mux
--local act = wezterm.action
local config = {}
local appearance = require("appearance")
local fonts = require("fonts")
local keys = require("keys")
local mouse_bindings = require("mouse-bindings")
local launch_menu = {}

local is_windows = true

if wezterm.target_triple == "x86_64-pc-windows-mvc" then
	wezterm.log_info("We're running in Windows!")
end

-- This will hold the configuration.
if wezterm.config_builder() then
	config = wezterm.config_builder()
end

if is_windows then
	config.default_prog = { "pwsh.exe", "-NoLogo" }
	table.insert(launch_menu, {
		label = "PowerShell",
		args = { "powershell", "-NoLogo" },
	})

	table.insert(launch_menu, {
		label = "Pwsh",
		args = { "pwsh.exe", "-NoLogo" },
	})
else
	table.insert(launch_menu, {
		label = "pwsh",
		args = { "/usr/local/bin/pwsh", "-NoLogo", "-NoProfile" },
	})
end
config.launch_menu = launch_menu

appearance.setup(config, is_windows)
fonts.setup(config)
keys.setup(config)
mouse_bindings.setup(config)

-- and finally, return the configuration to wezterm
return config
