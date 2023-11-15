local wezterm = require("wezterm")
local act = wezterm.action

local config = {}
-- Use config builder object if possible
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- local function scheme_for_appearance(appearance)
--   if appearance:find("Dark") then
--     return "Catppuccin Mocha"
--   else
--     return "Catppuccin Latte"
--   end
-- end

-- config.color_scheme = scheme_for_appearance(wezterm.gui.get_appearance())
config.color_scheme = "Tokyo Night"
config.font = wezterm.font_with_fallback({
  { family = "Iosevka Nerd Font", scale = 1.4, weight = "Bold" },
  { family = "FiraCode Nerd Font Mono", scale = 1.2 },
})
config.window_background_opacity = 0.9
config.window_decorations = "RESIZE"
config.scrollback_lines = 10000
config.default_workspace = "main"

-- Dim inactive panes
config.inactive_pane_hsb = {
  saturation = 0.24,
  brightness = 0.5,
}

config.tab_bar_at_bottom = true

-- Keys
config.leader = { key = "b", mods = "CTRL", timeout_milliseconds = 1000 }
config.keys = {
  -- Send C-b when pressing C-b twice
  { key = "b", mods = "LEADER|CTRL", action = act.SendKey({ key = "b", mods = "CTRL" }) },

  { key = "p", mods = "CMD|SHIFT", action = act.ActivateCommandPalette },

  -- Pane keybindings
  { key = '"', mods = "LEADER", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
  { key = "%", mods = "LEADER", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
  { key = "h", mods = "LEADER", action = act.ActivatePaneDirection("Left") },
  { key = "j", mods = "LEADER", action = act.ActivatePaneDirection("Down") },
  { key = "k", mods = "LEADER", action = act.ActivatePaneDirection("Up") },
  { key = "l", mods = "LEADER", action = act.ActivatePaneDirection("Right") },
  { key = "h", mods = "SUPER", action = act.ActivatePaneDirection("Left") },
  { key = "j", mods = "SUPER", action = act.ActivatePaneDirection("Down") },
  { key = "k", mods = "SUPER", action = act.ActivatePaneDirection("Up") },
  { key = "l", mods = "SUPER", action = act.ActivatePaneDirection("Right") },
  { key = "x", mods = "LEADER", action = act.CloseCurrentPane({ confirm = true }) },
  { key = "o", mods = "LEADER", action = act.RotatePanes("Clockwise") },
  { key = "z", mods = "LEADER", action = act.TogglePaneZoomState },
  { key = "r", mods = "LEADER", action = act.ActivateKeyTable({ name = "resize_pane", one_shot = false }) },
  { key = "LeftArrow", mods = "SUPER", action = act.AdjustPaneSize({ "Left", 1 }) },
  { key = "DownArrow", mods = "SUPER", action = act.AdjustPaneSize({ "Down", 1 }) },
  { key = "UpArrow", mods = "SUPER", action = act.AdjustPaneSize({ "Up", 1 }) },
  { key = "RightArrow", mods = "SUPER", action = act.AdjustPaneSize({ "Right", 1 }) },

  -- Tab keybindings
  { key = "c", mods = "LEADER", action = act.SpawnTab("CurrentPaneDomain") },
  { key = " ", mods = "LEADER", action = act.ShowTabNavigator },
  { -- Rename tab
    key = ",",
    mods = "LEADER",
    action = act.PromptInputLine({
      description = wezterm.format({
        { Attribute = { Intensity = "Bold" } },
        { Foreground = { AnsiColor = "Fuchsia" } },
        { Text = "Renaming Tab Title...:" },
      }),
      action = wezterm.action_callback(function(window, pane, line)
        if line then
          window:active_tab():set_title(line)
        end
      end),
    }),
  },

  -- Workspace
  { key = "s", mods = "LEADER", action = act.ShowLauncherArgs({ flags = "FUZZY|WORKSPACES" }) },
  { key = "w", mods = "LEADER", action = act.SwitchToWorkspace },
  {
    key = "n",
    mods = "LEADER",
    action = act.PromptInputLine({
      description = wezterm.format({
        { Attribute = { Intensity = "Bold" } },
        { Foreground = { AnsiColor = "Fuchsia" } },
        { Text = "Enter name for new workspace" },
      }),
      action = wezterm.action_callback(function(window, pane, line)
        -- line will be `nil` if they hit escape without entering anything
        -- An empty string if they just hit enter
        -- Or the actual line of text they wrote
        if line then
          window:perform_action(
            act.SwitchToWorkspace({
              name = line,
            }),
            pane
          )
        end
      end),
    }),
  },
}

-- Select tab by number
for i = 1, 9 do
  table.insert(config.keys, {
    key = tostring(i),
    mods = "LEADER",
    action = act.ActivateTab(i - 1),
  })
end

config.key_tables = {
  resize_pane = {
    { key = "h", action = act.AdjustPaneSize({ "Left", 1 }) },
    { key = "j", action = act.AdjustPaneSize({ "Down", 1 }) },
    { key = "k", action = act.AdjustPaneSize({ "Up", 1 }) },
    { key = "l", action = act.AdjustPaneSize({ "Right", 1 }) },
    { key = "Escape", action = "PopKeyTable" },
    { key = "Enter", action = "PopKeyTable" },
  },
}

-- tab bar
config.use_fancy_tab_bar = false

-- Set font when using fancy tab bar
config.window_frame = {
  font = wezterm.font({ family = "FiraCode", weight = "Bold" }),
  font_size = 16.0,
}

wezterm.on("update-status", function(window, pane)
  -- Workspace name
  local stat = window:active_workspace()
  local stat_color = "#f7768e"
  -- It's a little silly to have workspace name all the time
  -- Utilize this to display LDR or current key table name
  if window:active_key_table() then
    stat = window:active_key_table()
    stat_color = "#7dcfff"
  end
  if window:leader_is_active() then
    stat = "LDR"
    stat_color = "#bb9af7"
  end

  -- Current working directory
  local basename = function(s)
    -- Nothing a little regex can't fix
    return string.gsub(s, "(.*[/\\])(.*)", "%2")
  end
  -- CWD and CMD could be nil (e.g. viewing log using Ctrl-Alt-l). Not a big deal, but check in case
  local cwd = pane:get_current_working_dir()
  cwd = cwd and basename(cwd) or ""
  -- Current command
  local cmd = pane:get_foreground_process_name()
  cmd = cmd and basename(cmd) or ""

  -- Time
  local time = wezterm.strftime("%H:%M")

  -- Left status (left of the tab line)
  window:set_left_status(wezterm.format({
    { Foreground = { Color = stat_color } },
    { Text = "  " },
    { Text = wezterm.nerdfonts.md_alien_outline .. " " .. stat },
    { Text = " " },
  }))

  -- Right status
  window:set_right_status(wezterm.format({
    { Text = wezterm.nerdfonts.md_folder .. " " .. cwd },
    { Text = " | " },
    { Foreground = { Color = "#e0af68" } },
    { Text = wezterm.nerdfonts.fa_code .. " " .. cmd },
    "ResetAttributes",
    { Text = " | " },
    { Text = wezterm.nerdfonts.md_clock .. " " .. time },
    { Text = " " },
  }))
end)

return config
