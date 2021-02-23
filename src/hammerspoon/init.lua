-- Reload config
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "R", hs.reload)

-- Some applications have alternate names which can also be checked if you
-- enable Spotlight support with
hs.application.enableSpotlightForNameSearches(true)

hs.layout.mid50       = hs.geometry.new({x = 0.25,  y = 0,     w = 0.5,   h = 1.0})
hs.layout.top75       = hs.geometry.new({x = 0,     y = 0,     w = 1.0,   h = 0.77})
hs.layout.bottomleft  = hs.geometry.new({x = 0,     y = 0.77,  w = 0.8,   h = 0.23})
hs.layout.bottomright = hs.geometry.new({x = 0.8,   y = 0.77,  w = 0.2,   h = 0.23})
hs.layout.iTunesMini  = hs.geometry.new({x = 0.83,  y = 0,     w = 0.17,  h = 1})

-- default_browser = "Google Chrome"
default_browser = "Firefox"

-- Layouts
work = {
  {"Mail",           nil,             "DELL U3415W",  hs.layout.left25,      nil,  nil},
  {"iTerm2",         nil,             "DELL U3415W",  hs.layout.mid50,       nil,  nil},
  {"Amazon Chime",   "Amazon Chime",  "DELL U3415W",  hs.layout.right25,     nil,  nil},
  {default_browser,  nil,             "DELL U2715H",  hs.layout.maximized,   nil,  nil},
  {"iTunes",         "Mini Player",   "Color LCD",    hs.layout.iTunesMini,  nil,  nil},
  {"iTunes",         nil,             "Color LCD",    nil,                   nil,  nil},
  {"Fantastical",    nil,             "Color LCD",    nil,                   nil,  nil},
}

work_browser = {
  {"Mail",           nil,             "DELL U3415W",  hs.layout.left25,      nil,  nil},
  {default_browser,  nil,             "DELL U3415W",  hs.layout.mid50,       nil,  nil},
  {"Amazon Chime",   "Amazon Chime",  "DELL U3415W",  hs.layout.right25,     nil,  nil},
  {"iTerm2",         nil,             "DELL U2715H",  hs.layout.maximized,   nil,  nil},
  {"iTunes",         "Mini Player",   "Color LCD",    hs.layout.iTunesMini,  nil,  nil},
  {"iTunes",         nil,             "Color LCD",    nil,                   nil,  nil},
  {"Fantastical",    nil,             "Color LCD",    nil,                   nil,  nil},
}

home = {
  {"Mail",           nil,             "ASUS PB287Q",  hs.layout.left25,      nil,  nil},
  {"iTerm2",         nil,             "ASUS PB287Q",  hs.layout.mid50,       nil,  nil},
  {"Amazon Chime",   "Amazon Chime",  "ASUS PB287Q",  hs.layout.right25,     nil,  nil},
  {default_browser,  nil,             "ASUS PB287Q",  hs.layout.mid50,       nil,  nil},
  {"iTunes",         "Mini Player",   "Color LCD",    hs.layout.iTunesMini,  nil,  nil},
  {"iTunes",         nil,             "Color LCD",    nil,                   nil,  nil},
}

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "E", function()
  hs.layout.apply(work)
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "1", function()
  hs.layout.apply(work)
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "2", function()
  hs.layout.apply(work_browser)
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "3", function()
  hs.layout.apply(home)
end)

-- Screens
-- for i, screen in pairs(hs.screen.allScreens()) do
--   print(screen:name())
-- end

function table.contains(table, value)
  for _, v in pairs(table) do
    if v == value then
      return true
    end
  end
  return false
end

function mutechime()
  local chime = hs.application.find('Amazon Chime')
  local current_window = hs.window.focusedWindow()
  local meeting_window = nil

  local window_filter = {
    'Amazon Chime',
    'Video',
  }

  for _, window in pairs(chime:allWindows()) do
    -- filter out the main Chime window
    if not table.contains(window_filter, window:title()) and window:title() ~= "" then
      meeting_window = window
      break
    end
  end

  if meeting_window then
    print("Focusing window: " .. meeting_window:title())
    meeting_window:focus()
    hs.eventtap.keyStroke({"cmd"}, "y")
    current_window:focus()
  end
end

hs.hotkey.bind({}, "F13", function()
  mutechime()
end)

function windowdetails()
  local win = hs.window.focusedWindow()
  local frame = win:frame()
  local screen = win:screen()

  local output = "Application:    " .. win:application():name()
  output = output .. "\n" .. "Window Title:   " ..  win:title()
  output = output .. "\n" .. "Screen name:    " .. screen:name()
  output = output .. "\n" .. "Top left:       " .. frame.x .. ", " .. frame.y
  output = output .. "\n" .. "Top left ratio: " .. string.format("%.2f", (frame.x / screen:frame().w)) .. ", " .. string.format("%.2f", (frame.y / screen:frame().h))
  output = output .. "\n" .. "Bottom right:   " .. frame.x2 .. ", " .. frame.y2
  output = output .. "\n" .. "Bottom ratio:   " .. string.format("%.2f", (frame.x2 / screen:frame().w)) .. ", " .. string.format("%.2f", (frame.y2 / screen:frame().h))
  output = output .. "\n" .. "Height:         " .. frame.h
  output = output .. "\n" .. "Width:          " .. frame.w
  return output
end

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "W", function()
  local s = windowdetails()
  print(s)
  hs.alert.show(s)
  -- hs.notify.new({title="Hammerspoon", informativeText=s}):send()
end)
