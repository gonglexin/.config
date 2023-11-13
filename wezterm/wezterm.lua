local wezterm = require("wezterm")
local act = wezterm.action

wezterm.on("update-right-status", function(window, pane)
  window:set_right_status(window:active_workspace())
end)

local function scheme_for_appearance(appearance)
  if appearance:find("Dark") then
    return "Catppuccin Mocha"
  else
    return "Catppuccin Latte"
  end
end

local config = {
  color_scheme = scheme_for_appearance(wezterm.gui.get_appearance()),
  font = wezterm.font("FiraCode Nerd Font"),
  font_size = 16.0,
  leader = { key = "b", mods = "CTRL" },

  keys = {
    { key = "a", mods = "LEADER|CTRL", action = act({ SendString = "\x01" }) },
    { key = "-", mods = "LEADER", action = act({ SplitVertical = { domain = "CurrentPaneDomain" } }) },
    { key = "\\", mods = "LEADER", action = act({ SplitHorizontal = { domain = "CurrentPaneDomain" } }) },
    { key = '"', mods = "LEADER", action = act({ SplitVertical = { domain = "CurrentPaneDomain" } }) },
    { key = "%", mods = "LEADER", action = act({ SplitHorizontal = { domain = "CurrentPaneDomain" } }) },
    { key = "z", mods = "LEADER", action = "TogglePaneZoomState" },
    { key = "c", mods = "LEADER", action = act({ SpawnTab = "CurrentPaneDomain" }) },
    { key = "h", mods = "LEADER", action = act({ ActivatePaneDirection = "Left" }) },
    { key = "j", mods = "LEADER", action = act({ ActivatePaneDirection = "Down" }) },
    { key = "k", mods = "LEADER", action = act({ ActivatePaneDirection = "Up" }) },
    { key = "l", mods = "LEADER", action = act({ ActivatePaneDirection = "Right" }) },
    { key = "H", mods = "LEADER|SHIFT", action = act({ AdjustPaneSize = { "Left", 5 } }) },
    { key = "J", mods = "LEADER|SHIFT", action = act({ AdjustPaneSize = { "Down", 5 } }) },
    { key = "K", mods = "LEADER|SHIFT", action = act({ AdjustPaneSize = { "Up", 5 } }) },
    { key = "L", mods = "LEADER|SHIFT", action = act({ AdjustPaneSize = { "Right", 5 } }) },
    { key = "1", mods = "LEADER", action = act({ ActivateTab = 0 }) },
    { key = "2", mods = "LEADER", action = act({ ActivateTab = 1 }) },
    { key = "3", mods = "LEADER", action = act({ ActivateTab = 2 }) },
    { key = "4", mods = "LEADER", action = act({ ActivateTab = 3 }) },
    { key = "5", mods = "LEADER", action = act({ ActivateTab = 4 }) },
    { key = "6", mods = "LEADER", action = act({ ActivateTab = 5 }) },
    { key = "7", mods = "LEADER", action = act({ ActivateTab = 6 }) },
    { key = "8", mods = "LEADER", action = act({ ActivateTab = 7 }) },
    { key = "9", mods = "LEADER", action = act({ ActivateTab = 8 }) },
    { key = "&", mods = "LEADER|SHIFT", action = act({ CloseCurrentTab = { confirm = true } }) },
    { key = "x", mods = "LEADER", action = act({ CloseCurrentPane = { confirm = true } }) },
    { key = "s", mods = "LEADER", action = act.ShowLauncherArgs({ flags = "FUZZY|WORKSPACES" }) },
    { key = " ", mods = "LEADER", action = wezterm.action.ShowTabNavigator },

    { key = "p", mods = "CMD|SHIFT", action = act.ActivateCommandPalette },

    -- Switch to the default workspace
    { key = "y", mods = "LEADER", action = act.SwitchToWorkspace({ name = "default" }) },
    -- Switch to a monitoring workspace, which will have `top` launched into it
    {
      key = "u",
      mods = "LEADER",
      action = act.SwitchToWorkspace({ name = "monitoring", spawn = { args = { "top" } } }),
    },

    -- Create a new workspace with a random name and switch to it
    { key = "w", mods = "LEADER", action = act.SwitchToWorkspace },

    -- Prompt for a name to use for a new workspace and switch to it.
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
  },
}

return config
