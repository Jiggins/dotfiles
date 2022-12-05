-- Reload config
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "R", hs.reload)

-- Some applications have alternate names which can also be checked if you
-- enable Spotlight support with
hs.application.enableSpotlightForNameSearches(true)

-- default_browser = "Google Chrome"
default_browser = "Firefox"
default_terminal = "iTerm2"

macbook_monitor = "Built-in Retina Display"

locations = {
  work = {
    ["centre_monitor"] = "DELL U3419W",
    ["vertical_monitor"] = "DELL U2722DE"
  },

  home = {
    ["centre_monitor"] = "LC32G7xT",
    ["vertical_monitor"] = "ASUS PB287Q"
  }
}

amazon_chime = "Amazon Chime"
last_chime_window = nil

-- This is set to the last window checked with the popup (ctrl+alt+cmd+w)
-- this variable is only used in the HammerSpoon console so I can debug
last_checked_window = nil

function sendNotification(title, message)
  local attributes = {
    title = message,
    subTitle = message
  }

  function id(x)
    return x
  end

  local notification = hs.notify.new(id, attributes)
end

function getMusicMiniPlayerWidth()
  local music_mini_width = 288
  local screen_width = hs.screen.primaryScreen():frame().w

  return music_mini_width / screen_width
end

function applyLayout(main_app)
  local main_screen = hs.screen.primaryScreen()

  if main_app == "terminal" then
    applications = { default_terminal, default_browser }
  elseif main_app == "browser" then
    applications = { default_browser, default_terminal }
  end

  for k, v in pairs(locations) do
    if main_screen:name() == locations[k]["centre_monitor"] then
      location = locations[k]
    end
  end

  if not location then
    print("Cannot find layout for main screen: " .. main_screen:name())
    return
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

  -- focus the window on the main screen after applying the layout
  hs.application.find(applications[1]):mainWindow():focus()
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

-- This method is used to check if a window is a Chime meeting window, it does this by comparing the window title
-- against a list of known non-meeting window and some other factors. Chime changes the way it titles meetings so
-- often, this is likely the part that breaks if meeting tracking starts or ends early.
function isChimeMeetingWindow(window)
  local window_filter = {
    'Amazon Chime',
    'Mute box',
    'Screen share toolbar',
    'Video',
    'Window'
  }

  -- The Chime meeting window is maximizable, the new meeting popup also has the meeting name as a window title. To
  -- prevent it from tracking a meeting I haven't joined yet, we exclude any window that is not maximizable
  if not window:isMaximizable() then
    return false
  end

  return not table.contains(window_filter, window:title()) and window:title() ~= ""
end

function sendkeystochime(modifiers, key)
  local chime = hs.application.find('Amazon Chime')

  for _, window in pairs(chime:allWindows()) do
    -- filter out the main Chime window
    if isChimeMeetingWindow(window) then
      last_chime_window = window
      break
    end
  end

  if last_chime_window then
    if chime:focusedWindow():title() ~= last_chime_window:title() then
      print("Focusing window: " .. last_chime_window:title())
      last_chime_window:becomeMain()
    end

    hs.eventtap.keyStroke(modifiers, key, 0, chime)
  end
end

function resumeTask()
  local stdout = hs.execute("active-task.sh --resume", true)
  hs.notify.show("Timewarrior", "Resume task", stdout)
  print("Timewarrior", stdout)
end

function stopTask()
  local stdout = hs.execute("active-task.sh --stop", true)
  hs.notify.show("Timewarrior", "Stopping task", stdout)
  print("Timewarrior", stdout)
end

function trackMeeting(meeting_name)
  hs.execute("active-task.sh --stop", true)
  local stdout = hs.execute("timew track +meeting '" .. meeting_name .. "'", true)

  print("Tracking meeting: " .. meeting_name)
  hs.notify.show("Timewarrior", "Tracking meeting: " .. meeting_name, stdout)
end

function stopMeeting()
  stdout = hs.execute("timew stop", true)

  print("Meeting ended")
  print(stdout)
  hs.notify.show("Timewarrior", "Meeting ended", stdout)
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

hs.hotkey.bind({}, "F16", function()
  resumeTask()
end)

hs.hotkey.bind({}, "F17", function()
  stopTask()
end)

function onWindowEvent(window, applicationName, eventType)
  hs.timer.usleep(2 * 1000000)

  if applicationName == amazon_chime then
    if eventType == hs.window.filter.windowCreated then
      if isChimeMeetingWindow(window) then
        print("Name: '" .. applicationName .. "' Event: '" .. eventType .. "' Window: '" .. window:title() .. "'")
        local meeting_name = string.gsub(window:title(), amazon_chime .. ": ", "")

        trackMeeting(meeting_name)
        last_chime_window = window
      end
    end

    if eventType == hs.window.filter.windowDestroyed then
      -- If the closed window's ID matches the ID of the last Chime window, then end the tracking
      if last_chime_window ~= nil and last_chime_window:id() == window:id() then
        stopMeeting()
      end
    end
  end
end

function windowdetails()
  local win = hs.window.focusedWindow()
  local frame = win:frame()
  local screen = win:screen()
  local zoomButtonRect = win:zoomButtonRect()

  last_checked_window = win

  local output = "Application:    " .. win:application():name()
  output = output .. "\n" .. "Window Title:   " ..  win:title()
  output = output .. "\n" .. "Window ID:      " .. win:id()
  output = output .. "\n" .. "Screen name:    " .. screen:name()
  output = output .. "\n" .. "Top left:       " .. frame.x .. ", " .. frame.y
  output = output .. "\n" .. "Top left ratio: " .. string.format("%.2f", (frame.x / screen:frame().w)) .. ", " .. string.format("%.2f", (frame.y / screen:frame().h))
  output = output .. "\n" .. "Bottom right:   " .. frame.x2 .. ", " .. frame.y2
  output = output .. "\n" .. "Bottom ratio:   " .. string.format("%.2f", (frame.x2 / screen:frame().w)) .. ", " .. string.format("%.2f", (frame.y2 / screen:frame().h))
  output = output .. "\n" .. "Window:         " .. frame.h .. ", " .. frame.w
  output = output .. "\n" .. "Screen          " .. screen:frame().h .. ", " .. screen:frame().w
  output = output .. "\n" .. "Is standard?    " .. tostring(win:isStandard())
  output = output .. "\n" .. "Is maximizable? " .. tostring(win:isMaximizable())
  output = output .. "\n" .. "Subrole:        " .. win:subrole()
  output = output .. "\n" .. "Zoom button:    " .. zoomButtonRect.x .. ", " .. zoomButtonRect.y .. ", " .. zoomButtonRect.w .. ", " .. zoomButtonRect.h

  return output
end

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "W", function()
  local s = windowdetails()
  print(s)
  hs.alert.show(s)
  -- hs.notify.new({title="Hammerspoon", informativeText=s}):send()
end)

caffeinateWatcher = hs.caffeinate.watcher.new(function(event)
  if event == hs.caffeinate.watcher.screensDidLock then
    print("Caffeinate lock screen event")
    if os.date("*t", os.time())["hour"] >= 18 then
      print("It's late, stopping tasks")
      hs.execute("active-task.sh --stop", true)
      hs.execute("timew stop", true)
    end
  end
end)

windowFilter = hs.window.filter.new(false)
windowFilter:allowApp(amazon_chime)
windowFilter:subscribe({hs.window.filter.windowCreated, hs.window.filter.windowDestroyed}, onWindowEvent)
