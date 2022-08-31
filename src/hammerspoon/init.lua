-- Reload config
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "R", hs.reload)

-- Some applications have alternate names which can also be checked if you
-- enable Spotlight support with
hs.application.enableSpotlightForNameSearches(true)

-- default_browser = "Google Chrome"
default_browser = "Firefox"

macbook_monitor = "Built-in Retina Display"

locations = {
  work = {
    ["centre_monitor"] = "DELL U3419W",
    ["vertical_monitor"] = "DELL U2715H"
  },

  home = {
    ["centre_monitor"] = "LC32G7xT",
    ["vertical_monitor"] = "ASUS PB287Q"
  }
}

amazon_chime = "Amazon Chime"
last_chime_window = nil

function getMusicMiniPlayerWidth()
  local music_mini_width = 288
  local screen_width = hs.screen.primaryScreen():frame().w

  return music_mini_width / screen_width
end

function applyLayout(main_app)
  local main_screen = hs.screen.primaryScreen()

  if main_app == "terminal" then
    applications = { "iTerm2", default_browser }
  elseif main_app == "browser" then
    applications = { default_browser, "iTerm2" }
  end

  for k, v in pairs(locations) do
    if main_screen:name() == locations[k]["centre_monitor"] then
      location = locations[k]
    end
  end

  local music_mini_player_width = getMusicMiniPlayerWidth()
  hs.layout.main_app    = hs.geometry.rect(music_mini_player_width, 0, 1 - music_mini_player_width, 1)
  hs.layout.music_mini  = hs.geometry.rect(0, 0, music_mini_player_width, 1)

  layout = {
    {applications[1],  nil,            location["centre_monitor"],    hs.layout.main_app,    nil,  nil},
    {applications[2],  nil,            location["vertical_monitor"],  hs.layout.maximized,   nil,  nil},
    {"Music",          nil,            macbook_monitor,               nil,                   nil,  nil},
    {"Music",          "Mini Player",  location["centre_monitor"],    hs.layout.music_mini,  nil,  nil},
    {amazon_chime,     amazon_chime,   macbook_monitor,               nil,                   nil,  nil},
    {"Calendar",       nil,            macbook_monitor,               nil,                   nil,  nil},
    {"Discord",        nil,            macbook_monitor,               nil,                   nil,  nil},
    {"Mail",           nil,            macbook_monitor,               nil,                   nil,  nil},
    {"Signal",         nil,            macbook_monitor,               nil,                   nil,  nil},
    {"Slack",          nil,            macbook_monitor,               nil,                   nil,  nil},
  }

  hs.layout.apply(layout)
end

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "1", function()
  applyLayout("terminal")
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "2", function()
  applyLayout("browser")
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

function isChimeMeetingWindow(window)
  local window_filter = {
    'Amazon Chime',
    'Mute box',
    'Screen share toolbar',
    'Video',
    'Window'
  }

  return not table.contains(window_filter, window:title()) and window:title() ~= ""
end

function sendkeystochime(modifiers, key)
  local chime = hs.application.find('Amazon Chime')
  local meeting_window = nil

  for _, window in pairs(chime:allWindows()) do
    -- filter out the main Chime window
    if isChimeMeetingWindow(window) then
      meeting_window = window
      break
    end
  end

  if meeting_window then
    if chime:focusedWindow():title() ~= meeting_window:title() then
      print("Focusing window: " .. meeting_window:title())
      meeting_window:becomeMain()
    end

    hs.eventtap.keyStroke(modifiers, key, 0, chime)
  end
end

function mutechime()
  sendkeystochime({"cmd"}, "y")
end

function togglechimevideo()
  sendkeystochime({"cmd", "alt"}, "v")
end

hs.hotkey.bind({}, "F13", function()
  mutechime()
end)

hs.hotkey.bind({}, "F14", function()
  togglechimevideo()
end)

hs.hotkey.bind({}, "F15", function()
  sendkeystochime({"cmd", "alt"}, "e")
end)

function onWindowEvent(window, applicationName, eventType)
  hs.timer.usleep(2 * 1000000)
  -- print("Name: " .. applicationName .. " Event: " .. eventType .. " Window: " .. window:title())

  if applicationName == amazon_chime then
    if eventType == hs.window.filter.windowCreated then
      if isChimeMeetingWindow(window) then
        local meeting_name = string.gsub(window:title(), amazon_chime .. ": ", "")

        print("Tracking meeting: " .. meeting_name)
        hs.execute("active-task.sh --stop", true)
        hs.execute("timew track +meeting '" .. meeting_name .. "'", true)

        last_chime_window = window
      end
    end

    if eventType == hs.window.filter.windowDestroyed then
      -- When the meeting window is closed, it's title is an empty string
      if last_chime_window ~= nil and last_chime_window:title() == "" then
        print("Meeting ended")
        hs.execute("timew stop", true)
      end
    end
  end
end

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
  output = output .. "\n" .. "Window:         " .. frame.h .. ", " .. frame.w
  output = output .. "\n" .. "Screen          " .. screen:frame().h .. ", " .. screen:frame().w
  return output
end

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "W", function()
  local s = windowdetails()
  print(s)
  hs.alert.show(s)
  -- hs.notify.new({title="Hammerspoon", informativeText=s}):send()
end)

windowFilter = hs.window.filter.new(false)
windowFilter:allowApp(amazon_chime)
windowFilter:subscribe({hs.window.filter.windowCreated, hs.window.filter.windowDestroyed}, onWindowEvent)
