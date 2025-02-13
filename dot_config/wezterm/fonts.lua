local wezterm = require("wezterm")
local M = {}

function M.setup(config)
	config.font = wezterm.font_with_fallback({
		{ family = "DaddyTimeMono Nerd Font Mono" },
		{ family = "Hack Nerd Font Mono" },
		{ family = "Caskaydiacove Nerd Font Mono" },
		{ family = "Consolas" },
	})
	config.font_size = 12
	config.window_frame = {
		font = wezterm.font({
			family = "DaddyTimeMono Nerd Font Mono",
			weight = "Regular",
		}),
		font_size = 12,
	}
end

return M
