local wezterm = require("wezterm")
local act = wezterm.action
local config = wezterm.config_builder()

-- === Performance & Frontend ===
config.front_end = "OpenGL"
config.max_fps = 15
config.animation_fps = 1
config.cursor_blink_rate = 5000
config.term = "xterm-256color"

-- === Font ===
config.font = wezterm.font({ family = "GoMono Nerd Font Mono", weight = "Regular" })
config.font_size = 9.0
config.cell_width = 0.9

-- === Appearance ===
config.window_background_opacity = 0.9
config.prefer_egl = true
config.color_scheme = 'Grayscale (dark) (terminal.sexy)'

config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}

-- === Tabs ===
config.hide_tab_bar_if_only_one_tab = false
config.use_fancy_tab_bar = false

--- === Window Decorations toggle ===
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
        args = {"D:/1 - PortableApps/btop4win-x64/btop4win/btop4win.exe"},
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
        args = {"D:/1 - PortableApps/Helix/helix-25.01.1-x86_64-windows/hx.exe"},
      },
    },
  },
}

-- === Default shell ===
config.default_prog = { "powershell.exe", "-NoLogo" }
config.initial_cols = 80

return config
