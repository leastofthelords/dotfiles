local wezterm = require("wezterm")
local act = wezterm.action
local config = wezterm.config_builder()

-- === Performance & Frontend ===
config.front_end = "OpenGL"
config.max_fps = 144
config.animation_fps = 1
config.cursor_blink_rate = 500
config.term = "xterm-256color"

-- === Font ===
config.font = wezterm.font({ family = "GoMono Nerd Font Mono", weight = "Regular" }) -- [swap font if you wish]
config.font_size = 12.0
config.cell_width = 0.9

-- === Appearance ===
config.window_background_opacity = 0.9
config.prefer_egl = true

config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}

-- === Tabs === 
config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = false 

-- === Colors ===
config.colors = {
  foreground = "#CCCCCC",  -- Soft grey for text
  background = "#222222",  -- Very dark grey background
  cursor_bg = "#dccfe5",   -- Soft lavender for cursor background
  cursor_fg = "#222222",   -- Dark grey for cursor foreground
  cursor_border = "#dccfe5", -- Soft lavender for cursor border
  selection_fg = "#222222", -- Dark grey for selection foreground
  selection_bg = "#dccfe5", -- Soft lavender for selection background
  scrollbar_thumb = "#555555",  -- Dark grey for scrollbar
  split = "#444444", -- Very dark grey for split line

  ansi = {
    "#666666",  -- Soft dark grey for black
    "#777777",  -- Medium grey for red
    "#888888",  -- Grey for green
    "#999999",  -- Lighter grey for yellow
    "#AAAAAA",  -- Soft grey for blue
    "#BBBBBB",  -- Light grey for magenta
    "#DDDDDD",  -- Very light grey for cyan
    "#FFFFFF",  -- White for white
  },

  brights = {
    "#777777",  -- Grey for bright black
    "#888888",  -- Slightly lighter grey for bright red
    "#999999",  -- Grey for bright green
    "#AAAAAA",  -- Soft grey for bright yellow
    "#BBBBBB",  -- Light grey for bright blue
    "#DDDDDD",  -- Light grey for bright magenta
    "#DDDDDD",  -- Light grey for bright cyan
    "#FFFFFF",  -- Bright white for bright white
  },

  tab_bar = {
    background = "#222222",  -- Very dark grey for tab bar background
    active_tab = {
      bg_color = "#444444",   -- Dark grey for active tab background
      fg_color = "#dccfe5",   -- Soft lavender for active tab foreground
    },
    inactive_tab = {
      bg_color = "#222222",   -- Very dark grey for inactive tab background
      fg_color = "#777777",   -- Medium grey for inactive tab foreground
    },
    new_tab = {
      bg_color = "#222222",   -- Very dark grey for new tab background
      fg_color = "#dccfe5",   -- Soft lavender for new tab foreground
    },
  },
}

-- === Window Decorations toggle ===
config.window_decorations = "NONE | RESIZE"
wezterm.on("toggle-window-decoration", function(window, _)
  local overrides = window:get_config_overrides() or {}
  overrides.window_decorations = (overrides.window_decorations == "NONE | RESIZE")
    and "TITLEBAR | RESIZE"
    or "NONE | RESIZE"
  window:set_config_overrides(overrides)
end)

-- === Keybindings ===
config.keys = {
  -- Toggle decorations
  {
    key = "T",
    mods = "CTRL|SHIFT",
    action = act.EmitEvent("toggle-window-decoration"),
  },

  -- Pane splitting
  {
    key = "h",
    mods = "CTRL|SHIFT|ALT",
    action = act.SplitPane({ direction = "Right", size = { Percent = 50 } }),
  },
  {
    key = "v",
    mods = "CTRL|SHIFT|ALT",
    action = act.SplitPane({ direction = "Up", size = { Percent = 50 } }),
  },

  -- Resize panes
  { key = "U", mods = "CTRL|SHIFT", action = act.AdjustPaneSize({ "Left", 5 }) },
  { key = "I", mods = "CTRL|SHIFT", action = act.AdjustPaneSize({ "Down", 5 }) },
  { key = "O", mods = "CTRL|SHIFT", action = act.AdjustPaneSize({ "Up", 5 }) },
  { key = "P", mods = "CTRL|SHIFT", action = act.AdjustPaneSize({ "Right", 5 }) },

  -- Pane select and debug overlay
  { key = "9", mods = "CTRL", action = act.PaneSelect },
  { key = "L", mods = "CTRL", action = act.ShowDebugOverlay },

  -- Toggle background opacity
  {
    key = "O",
    mods = "CTRL|ALT",
    action = wezterm.action_callback(function(window, _)
      local overrides = window:get_config_overrides() or {}
      overrides.window_background_opacity = (overrides.window_background_opacity == 1.0) and 0.9 or 1.0
      window:set_config_overrides(overrides)
    end),
  },
}

-- === Default shell ===
config.default_prog = { "powershell.exe", "-NoLogo" } -- [change SHELL.exe to your shell]
config.initial_cols = 80

return config

