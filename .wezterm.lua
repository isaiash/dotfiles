-- Pull in the wezterm API
local wezterm = require 'wezterm'
local config = wezterm.config_builder()
-- Colors
config.color_scheme = 'Squirrelsong Dark'
config.window_frame = {
  active_titlebar_bg = '#574131',
  inactive_titlebar_bg = '#352A21',
}
-- Command Palette
config.command_palette_bg_color = "#44382D"
config.command_palette_fg_color = "#CFBAA5"
config.switch_to_last_active_tab_when_closing_tab = true
config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = true
config.tab_max_width = 32
config.pane_focus_follows_mouse = false
config.scrollback_lines = 5000
config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}

config.enable_scroll_bar = true
config.leader = {
  key = 'b',
  mods = 'CTRL',
  timeout_milliseconds = 2000,
}
config.bypass_mouse_reporting_modifiers = 'ALT'
config.keys = {
  {
    key = '[',
    mods = 'LEADER',
    action = wezterm.action.ActivateCopyMode,
  },
  {
    key = 'f',
    mods = 'ALT',
    action = wezterm.action.TogglePaneZoomState,
  },
  {
    key = 'c',
    mods = 'LEADER',
    action = wezterm.action.SpawnTab 'CurrentPaneDomain',
  },
  {
    key = 'n',
    mods = 'LEADER',
    action = wezterm.action.ActivateTabRelative(1),
  },
  {
    key = 'p',
    mods = 'LEADER',
    action = wezterm.action.ActivateTabRelative(-1),
  },
  {
    key = 'x',
    mods = 'LEADER',
    action = wezterm.action.CloseCurrentPane { confirm = false },
  },
  {
    key = "RightArrow",
    mods = "LEADER",
    action = wezterm.action{ActivatePaneDirection="Right"}
  },
  {
    key = "LeftArrow",
    mods = "LEADER",
    action = wezterm.action{ActivatePaneDirection="Left"}
  },
  {
    key = "UpArrow",
    mods = "LEADER",
    action = wezterm.action{ActivatePaneDirection="Up"}
  },
  {
    key = "DownArrow",
    mods = "LEADER",
    action = wezterm.action{ActivatePaneDirection="Down"}
  },
  {
    key = ',',
    mods = 'LEADER',
    action = wezterm.action.PromptInputLine {
      description = 'Enter new name for tab',
      action = wezterm.action_callback(
        function(window, pane, line)
          if line then
            window:active_tab():set_title(line)
          end
        end
      ),
    },
  },
  {
    key = 'w',
    mods = 'LEADER',
    action = wezterm.action.ShowTabNavigator,
  },
  {
    key = '&',
    mods = 'LEADER|SHIFT',
    action = wezterm.action.CloseCurrentTab{ confirm = true },
  },
  {
    key = '|',
    mods = 'LEADER|SHIFT',
    action = wezterm.action.SplitPane {
      direction = 'Right',
      size = { Percent = 50 },
    },
  },
  {
    key = '-',
    mods = 'LEADER',
    action = wezterm.action.SplitPane {
      direction = 'Down',
      size = { Percent = 50 },
    },
  },
}
return config
