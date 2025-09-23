local wezterm = require("wezterm")
local act = wezterm.action
local config = wezterm.config_builder()
config.exit_behavior = "Close"


-- === Performance & Frontend ===
config.front_end = "OpenGL"
config.max_fps = 25
config.animation_fps = 20
config.cursor_blink_rate = 5000
config.term = "xterm-256color"

config.background = {
  {
    source = {
      File = "E:/Wallpapers/skyfrishupscaledgreyscale.png"
    },
  },
}

-- === Font ===
config.font = wezterm.font({ family = "GoMono Nerd Font Mono", weight = "Bold" })
config.font_size = 10.0
config.cell_width = 0.9


-- === Appearance ===
config.window_background_opacity = 0.9
config.prefer_egl = true
config.window_background_opacity = 0
config.win32_system_backdrop = 'Acrylic'
config.color_scheme = 'Black Metal (Mayhem) (base16)'
config.window_padding = {
  left = 10,
  right = 10,
  top = 10,
  bottom = 10,
}

config.colors = { 
  -- The default text color
  foreground = 'black',
  -- The default background color
  background = 'white',

  cursor_bg = '#52ad70',
  cursor_fg = 'black',
  cursor_border = '#52ad70',

  -- the foreground color of selected text
  selection_fg = 'black',
  -- the background color of selected text
  selection_bg = '#fffacd',

  scrollbar_thumb = '#222222',
  split = '#444444',

  ansi = {
    'black',
    'black',
    'black',
    'black',
    'black',
    'black',
    'black',
    'black',
  },
  brights = {
    'black',
    'black',
    'black',
    'black',
    'black',
    'black',
    'black',
    'black',
  },

  indexed = { [136] = 'black' },

  compose_cursor = 'black',

  copy_mode_active_highlight_bg = { Color = 'white' },
  copy_mode_active_highlight_fg = { AnsiColor = 'Black' },
  copy_mode_inactive_highlight_bg = { Color = 'white' },
  copy_mode_inactive_highlight_fg = { AnsiColor = 'Black' },

  quick_select_label_bg = { Color = 'white' },
  quick_select_label_fg = { Color = 'black' },
  quick_select_match_bg = { Color = 'white' },
  quick_select_match_fg = { Color = 'black' },
}


-- === Tabs ===
config.hide_tab_bar_if_only_one_tab = false
config.use_fancy_tab_bar = true

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
        args = {"D:/Commandline TUI (non scoop)/Btop4win/btop4win/btop4win.exe"},
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
        args = {"D:/Commandline TUI (non scoop)/Helix/helix-25.01.1-x86_64-windows/hx.exe"},
      },
    },
  },
}

-- === Default shell ===
config.default_prog = { "powershell.exe", "-NoLogo" }
config.initial_cols = 80

return config
