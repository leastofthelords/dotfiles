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
  foreground = "#CCCCCC",
  background = "#222222",
  cursor_bg = "#CCCCCC",
  cursor_fg = "#222222",
  cursor_border = "#CCCCCC",
  selection_fg = "#222222",
  selection_bg = "#888888",
  scrollbar_thumb = "#555555",
  split = "#444444",

  ansi = {
    "#000000", 
    "#555555", 
    "#AAAAAA", 
    "#999999", 
    "#AAAAAA", 
    "#BBBBBB", 
    "#BBBBBB", 
    "#DDDDDD", 
  },
  brights = {
    "#222222", "#666666", "#BBBBBB", "#AAAAAA",
    "#BBBBBB", "#CCCCCC", "#CCCCCC", "#FFFFFF"
  },

  tab_bar = {
    background = "#222222",
    active_tab = {
      bg_color = "#444444",
      fg_color = "#CCCCCC",
    },
    inactive_tab = {
      bg_color = "#222222",
      fg_color = "#777777",
    },
    new_tab = {
      bg_color = "#222222",
      fg_color = "#CCCCCC",
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

  -- Launch btop4win in split pane
  {
    key = "B",
    mods = "CTRL|SHIFT",
    action = act.SplitPane {
      direction = "Right",
      size = { Percent = 50 },
      command = {
        args = {"/btop4win.exe"}, -- [Insert Path]
      },
    },
  },

  -- Launch Helix  in split pane
  {
    key = "N",
    mods = "CTRL|SHIFT",
    action = act.SplitPane {
      direction = "Left",
      size = { Percent = 50 },
      command = {
        args = {"/hx.exe"}, -- [Insert Path]
      },
    },
  },
}

-- === Default shell ===
config.default_prog = { "SHELL.exe", "-NoLogo" } -- [change SHELL.exe to your shell]
config.initial_cols = 80

return config
