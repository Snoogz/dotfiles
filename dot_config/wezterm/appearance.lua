local wezterm = require("wezterm")
local M = {}

function M.setup(config, is_windows)
	if is_windows then
		wezterm.log_info("Windows decorations")
		config.window_background_opacity = 0.5
		config.webgpu_power_preference = "HighPerformance"
		config.front_end = "OpenGL"
		config.prefer_egl = true
	end
	config.hide_tab_bar_if_only_one_tab = true
	config.default_cursor_style = "BlinkingBar"
	config.use_fancy_tab_bar = true
	config.window_decorations = "RESIZE"
	config.color_scheme = "Gruvbox Dark (Gogh)"
end

return M
