local wezterm = require('wezterm')
local platform = require('utils.platform')()
local act = wezterm.action

local mod = {}


local keys = {
   -- misc/useful --
   { key = 'F1', mods = 'NONE', action = 'ActivateCopyMode' },
   { key = 'F2', mods = 'NONE', action = act.ActivateCommandPalette },
   { key = 'F3', mods = 'NONE', action = act.ShowLauncher },
   { key = 'F4', mods = 'NONE', action = act.ShowTabNavigator },
   { key = 'F11', mods = 'NONE', action = act.ToggleFullScreen },
   { key = 'F12', mods = 'NONE', action = act.ShowDebugOverlay },
   { key = 'f', mods = 'LEADER', action = act.Search({ CaseInSensitiveString = '' }) },

   -- copy/paste --
   { key = 'c', mods = 'CTRL|SHIFT', action = act.CopyTo('Clipboard') },
   { key = 'v', mods = 'CTRL|SHIFT', action = act.PasteFrom('Clipboard') },

   -- tabs --
   -- tabs: spawn+close
   { key = 't', mods = 'LEADER', action = act.SpawnTab('DefaultDomain') },
   -- { key = 't', mods = 'LEADER', action = act.SpawnTab({ DomainName = 'WSL:NixOS' }) },
   { key = 'x', mods = 'LEADER', action = act.CloseCurrentTab({ confirm = false }) },

   -- tabs: navigation
   { key = '(', mods = 'LEADER', action = act.ActivateTabRelative(-1) },
   { key = ')', mods = 'LEADER', action = act.ActivateTabRelative(1) },
   { key = '[', mods = 'LEADER', action = act.MoveTabRelative(-1) },
   { key = ']', mods = 'LEADER', action = act.MoveTabRelative(1) },

   -- window --
   -- spawn windows
   { key = 'n', mods = 'LEADER', action = act.SpawnWindow },

   -- panes --
   -- panes: split panes
   {
      key = 'v',
      mods = 'LEADER',
      action = act.SplitVertical({ domain = 'CurrentPaneDomain' }),
   },
   {
      key = 'h',
      mods = 'LEADER',
      action = act.SplitHorizontal({ domain = 'CurrentPaneDomain' }),
   },
   {
      key = '-',
      mods = 'LEADER',
      action = act.CloseCurrentPane({ confirm = false }),
   },

   -- panes: zoom+close pane
   { key = 'z', mods = 'LEADER', action = act.TogglePaneZoomState },
   { key = 'w', mods = 'LEADER', action = act.CloseCurrentPane({ confirm = false }) },

   -- panes: navigation
   { key = 'n', mods = 'LEADER', action = act.ActivatePaneDirection('Left') },
   { key = 'e', mods = 'LEADER', action = act.ActivatePaneDirection('Down') },
   { key = 'i', mods = 'LEADER', action = act.ActivatePaneDirection('Up') },
   { key = 'o', mods = 'LEADER', action = act.ActivatePaneDirection('Right') },

   -- panes: resize
   { key = 'LeftArrow', mods = 'LEADER', action = act.AdjustPaneSize({ 'Left', 1 }) },
   { key = 'DownArrow', mods = 'LEADER', action = act.AdjustPaneSize({ 'Down', 1 }) },
   { key = 'UpArrow', mods = 'LEADER', action = act.AdjustPaneSize({ 'Up', 1 }) },
   { key = 'RightArrow', mods = 'LEADER', action = act.AdjustPaneSize({ 'Right', 1 }) },

   -- fonts --
   -- fonts: resize
   { key = 'UpArrow', mods = 'LEADER', action = act.IncreaseFontSize },
   { key = 'DownArrow', mods = 'LEADER', action = act.DecreaseFontSize },
   { key = 'r', mods = 'LEADER', action = act.ResetFontSize },

   -- key-tables --
   -- resizes fonts
   {
      key = 'f',
      mods = 'LEADER',
      action = act.ActivateKeyTable({
         name = 'resize_font',
         one_shot = false,
         timemout_miliseconds = 1000,
      }),
   },
   -- resize panes
   {
      key = 'p',
      mods = 'LEADER',
      action = act.ActivateKeyTable({
         name = 'resize_pane',
         one_shot = false,
         timemout_miliseconds = 1000,
      }),
   },
   -- rename tab bar
   {
      key = 'R',
      mods = 'CTRL|SHIFT',
      action = act.PromptInputLine ({
         description = 'Enter new name for tab',
         action = wezterm.action_callback(function(window, pane, line)
            -- line will be `nil` if they hit escape without entering anything
            -- An empty string if they just hit enter
            -- Or the actual line of text they wrote
            if line then
               window:active_tab():set_title(line)
            end
         end),
      }),
   },
   -- activate tabs
   {
       key = '~',
       mods = 'LEADER',
       action = act.ActivateTab(0),
   },
   {
       key = '@',
       mods = 'LEADER',
       action = act.ActivateTab(1),
   },
   {
       key = '#',
       mods = 'LEADER',
       action = act.ActivateTab(2),
   },
   {
       key = '$',
       mods = 'LEADER',
       action = act.ActivateTab(3),
   },
   {
       key = '%',
       mods = 'LEADER',
       action = act.ActivateTab(4),
   },
}


local key_tables = {
   resize_font = {
      { key = 'i', action = act.IncreaseFontSize },
      { key = 'e', action = act.DecreaseFontSize },
      { key = 'r', action = act.ResetFontSize },
      { key = 'Escape', action = 'PopKeyTable' },
      { key = 'q', action = 'PopKeyTable' },
   },
   resize_pane = {
      { key = 'n', action = act.AdjustPaneSize({ 'Left', 1 }) },
      { key = 'e', action = act.AdjustPaneSize({ 'Down', 1 }) },
      { key = 'i', action = act.AdjustPaneSize({ 'Up', 1 }) },
      { key = 'o', action = act.AdjustPaneSize({ 'Right', 1 }) },
      { key = 'Escape', action = 'PopKeyTable' },
      { key = 'q', action = 'PopKeyTable' },
   },
}

local mouse_bindings = {
   -- Ctrl-click will open the link under the mouse cursor
   {
      event = { Up = { streak = 1, button = 'Left' } },
      mods = 'CTRL',
      action = act.OpenLinkAtMouseCursor,
   },
   -- Move mouse will only select text and not copy text to clipboard
   {
      event = { Down = { streak = 1, button = 'Left' } },
      mods = 'NONE',
      action = act.SelectTextAtMouseCursor 'Cell',
   },
   {
      event = { Up = { streak = 1, button = 'Left' } },
      mods = 'NONE',
      action = act.CompleteSelection("ClipboardAndPrimarySelection"),
   },
   {
      event = { Drag = { streak = 1, button = 'Left' } },
      mods = 'NONE',
      action = act.ExtendSelectionToMouseCursor 'Cell',
   },
   -- Triple Left click will select a line
   {
      event = { Down = { streak = 3, button = 'Left' } },
      mods = 'NONE',
      action = act.SelectTextAtMouseCursor 'Line',
   },
   {
      event = { Up = { streak = 3, button = 'Left' } },
      mods = 'NONE',
      action = act.CompleteSelection("ClipboardAndPrimarySelection"),
   },
   -- Double Left click will select a word
   {
      event = { Down = { streak = 2, button = 'Left' } },
      mods = 'NONE',
      action = act.SelectTextAtMouseCursor 'Word',
   },
   {
      event = { Up = { streak = 2, button = 'Left' } },
      mods = 'NONE',
      action = act.CompleteSelection("ClipboardAndPrimarySelection"),
   },
   -- Turn on the mouse wheel to scroll the screen
   {
      event = { Down = { streak = 1, button = { WheelUp = 1 } } },
      mods = 'NONE',
      action = act.ScrollByCurrentEventWheelDelta,
   },
   {
      event = { Down = { streak = 1, button = { WheelDown = 1 } } },
      mods = 'NONE',
      action = act.ScrollByCurrentEventWheelDelta,
   },
}

return {
   disable_default_key_bindings = true,
   disable_default_mouse_bindings = true,
   leader = { key = 'a', mods = 'CTRL' },
   keys = keys,
   key_tables = key_tables,
   mouse_bindings = mouse_bindings,
}
