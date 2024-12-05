local alert = require("hs.alert")
local application = require("hs.application")
local caffeinate = require("hs.caffeinate")
local eventtap = require("hs.eventtap")
local fnutils = require("hs.fnutils")
local geometry = require("hs.geometry")
local hotkey = require("hs.hotkey")
local layout = require("hs.layout")
local mouse = require("hs.mouse")
local notify = require("hs.notify")
local screen = require("hs.screen")
local timer = require("hs.timer")
local window = require("hs.window")

-- Reload config
hotkey.bind({"cmd", "alt", "ctrl"}, "R", hs.reload)

-- Some applications have alternate names which can also be checked if you
-- enable Spotlight support with
application.enableSpotlightForNameSearches(true)

-- default_browser = "Google Chrome"
local default_browser = "Firefox"
local default_terminal = "iTerm2"

local macbook_monitor = "Built-in Retina Display"

local amazon_chime = "Amazon Chime"
local log_level = 1

last_chime_window = nil

-- This is set to the last window checked with the popup (ctrl+alt+cmd+w)
-- this variable is only used in the HammerSpoon console so I can debug
local last_checked_window = nil

function string:startswith(start)
  return self:sub(1, #start) == start
end

function table.contains(table, value)
  for _, v in pairs(table) do
    if v == value then
      return true
    end
  end
  return false
end

function getMonitorConfig()
  local main_screen = screen.primaryScreen()
  local locations = {
    work = {
      ["centre_monitor"] = "DELL U3419W",
      ["vertical_monitor"] = "DELL U2722DE"
    },

    home = {
      ["centre_monitor"] = "LC32G7xT",
      ["vertical_monitor"] = "ASUS PB287Q"
    }
  }

  for k, _ in pairs(locations) do
    if main_screen:name() == locations[k]["centre_monitor"] then
      return locations[k]
    end
  end
end

function log(msg_log_level, thing)
  if msg_log_level > log_level then
    return
  end

  if type(thing) == "table" then
    for k, v in pairs(thing) do
      print(k, v)
    end

    return
  end

  print(thing)
end

function logdebug(thing)
  return log(0, thing)
end

function sendNotification(title, message)
  local attributes = {
    title = message,
    subTitle = message
  }

local function id(x)
    return x
  end

  notify.new(id, attributes)
end

function getMusicMiniPlayerWidth()
  local music_mini_width = 288
  local screen_width = screen.primaryScreen():frame().w

  return music_mini_width / screen_width
end

function applyLayout(main_app)
  local applications
  local main_app_layout
  local main_screen = screen.primaryScreen()
  local music_mini_player_width = getMusicMiniPlayerWidth()
  local location = getMonitorConfig()

  if not location then
    print("Cannot find layout for main screen: " .. main_screen:name())
    return
  end

  layout.music_mini  = geometry.rect(0, 0, music_mini_player_width, 1)
  layout.main_app = geometry.rect(music_mini_player_width, 0, 1 - music_mini_player_width, 1)

  if main_app == "terminal" then
    applications = { default_terminal, default_browser }
    main_app_layout = layout.maximized
  elseif main_app == "browser" then
    applications = { default_browser, default_terminal }
    main_app_layout = layout.maximized
  end

  local window_layout = {
    {applications[1],    nil,            location["centre_monitor"],    main_app_layout,    nil,  nil},
    {applications[2],    nil,            location["vertical_monitor"],  layout.maximized,   nil,  nil},
    {"Music",            nil,            macbook_monitor,               nil,                nil,  nil},
    {"Music",            "Mini Player",  location["centre_monitor"],    layout.music_mini,  nil,  nil},
    {amazon_chime,       amazon_chime,   macbook_monitor,               nil,                nil,  nil},
    {"Calendar",         nil,            macbook_monitor,               nil,                nil,  nil},
    {"Discord",          nil,            macbook_monitor,               nil,                nil,  nil},
    {"Mail",             nil,            macbook_monitor,               nil,                nil,  nil},
    {"Outlook",          nil,            macbook_monitor,               nil,                nil,  nil},
    {"Signal",           nil,            macbook_monitor,               nil,                nil,  nil},
    {"Slack",            nil,            macbook_monitor,               nil,                nil,  nil},
    {"System Settings",  nil,            macbook_monitor,               nil,                nil,  nil},
  }

  layout.apply(window_layout)

  -- focus the window on the main screen after applying the layout
  application.find(applications[1]):mainWindow():focus()
end

function splitLayout()
  local location = getMonitorConfig()

  local gap = 0
  local leftSplit = geometry.rect(gap, gap, 0.5 - (gap * 2), 1 - (gap * 2))
  local rightSplit = geometry.rect(0.5 + gap, gap, 0.5 - (gap * 2), 1 - (gap * 2))

  local window_layout = {
    {default_browser,    nil,            location["centre_monitor"],  leftSplit,          nil,  nil},
    {default_terminal,   nil,            location["centre_monitor"],  rightSplit,         nil,  nil},
    {"Music",            nil,            macbook_monitor,             nil,                nil,  nil},
    {"Music",            "Mini Player",  location["centre_monitor"],  layout.music_mini,  nil,  nil},
    {amazon_chime,       amazon_chime,   macbook_monitor,             nil,                nil,  nil},
    {"Calendar",         nil,            macbook_monitor,             nil,                nil,  nil},
    {"Discord",          nil,            macbook_monitor,             nil,                nil,  nil},
    {"Mail",             nil,            macbook_monitor,             nil,                nil,  nil},
    {"Outlook",          nil,            macbook_monitor,             nil,                nil,  nil},
    {"Signal",           nil,            macbook_monitor,             nil,                nil,  nil},
    {"Slack",            nil,            macbook_monitor,             nil,                nil,  nil},
    {"System Settings",  nil,            macbook_monitor,             nil,                nil,  nil},
  }

  layout.apply(window_layout)
end

hotkey.bind({"cmd", "alt", "ctrl"}, "1", function()
  applyLayout("terminal")
end)

hotkey.bind({"cmd", "alt", "ctrl"}, "2", function()
  applyLayout("browser")
end)

hotkey.bind({"cmd", "alt", "ctrl"}, "3", function()
  splitLayout()
end)

function get_window_under_mouse()
  -- Invoke `application` because `window.orderedWindows()` doesn't do it
  -- and breaks itself
  local _ = application

  local pos = geometry.new(mouse.getAbsolutePosition())
  local current_screen = mouse.getCurrentScreen()

  return fnutils.find(window.orderedWindows(), function(w)
    return current_screen == w:screen() and pos:inside(w:frame())
  end)
end

-- Screens
-- for i, screen in pairs(screen.allScreens()) do
--   print(screen:name())
-- end

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

  -- New feature in Chime where you can pop out a screen share session. This should not start a new timer as it's still
  -- the same meeting.
  if window:title():startswith("Amazon Chime Screen Share:") then
    return false
  end

  return not table.contains(window_filter, window:title()) and window:title() ~= ""
end

function sendkeystochime(modifiers, key)
  local chime = application.find('Amazon Chime')

  for _, window in pairs(chime:allWindows()) do
    -- filter out the main Chime window
    logdebug(window)
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

    eventtap.keyStroke(modifiers, key, 0, chime)
  end
end

function mutechime()
  sendkeystochime({"cmd"}, "y")
end

function togglechimevideo()
  sendkeystochime({"cmd", "alt"}, "v")
end

hotkey.bind({}, "F13", function()
  mutechime()
end)

hotkey.bind({}, "F14", function()
  togglechimevideo()
end)

hotkey.bind({}, "F15", function()
  sendkeystochime({"cmd", "alt"}, "e")
end)

function resumeTask()
  local stdout = hs.execute("active-task.sh --resume", true)
  notify.show("Timewarrior", "Resume task", stdout)
  print("Timewarrior", stdout)
end

function stopTask()
  local stdout = hs.execute("active-task.sh --stop", true)
  notify.show("Timewarrior", "Stopping task", stdout)
  print("Timewarrior", stdout)
end

function trackMeeting(meeting_name)
  hs.execute("active-task.sh --stop", true)
  local stdout = hs.execute("timew track +meeting '" .. meeting_name .. "'", true)

  print("Tracking meeting: " .. meeting_name)
  notify.show("Timewarrior", "Tracking meeting: " .. meeting_name, stdout)
end

function stopMeeting()
  local stdout = hs.execute("timew stop", true)

  print("Meeting ended")
  print(stdout)
  notify.show("Timewarrior", "Meeting ended", stdout)
end

hotkey.bind({}, "F16", function()
  resumeTask()
end)

hotkey.bind({}, "F17", function()
  stopTask()
end)

function onWindowEvent(event_window, applicationName, eventType)
  print("Name: '" .. applicationName .. "' Event: '" .. eventType .. "' Window: '" .. event_window:title() .. "'")

  if applicationName == amazon_chime then
    if eventType == window.filter.windowCreated then
      timer.usleep(2 * 1000000)
      if isChimeMeetingWindow(event_window) then
        print("Name: '" .. applicationName .. "' Event: '" .. eventType .. "' Window: '" .. event_window:title() .. "'")
        local meeting_name = string.gsub(event_window:title(), amazon_chime .. ": ", "")

        trackMeeting(meeting_name)
        last_chime_window = event_window
      end
    end

    if eventType == window.filter.windowDestroyed then
      -- If the closed window's ID matches the ID of the last Chime window, then end the tracking
      if last_chime_window ~= nil and last_chime_window:id() == event_window:id() then
        stopMeeting()
      end
    end
  end
end

function windowdetails()
  last_checked_window = window.focusedWindow()

  local frame = last_checked_window:frame()
  local current_screen = last_checked_window:screen()
  local zoomButtonRect = last_checked_window:zoomButtonRect()

  local output = "Application:    " .. last_checked_window:application():name()
  output = output .. "\n" .. "Window Title:   " .. last_checked_window:title()
  output = output .. "\n" .. "Window ID:      " .. last_checked_window:id()
  output = output .. "\n" .. "Screen name:    " .. current_screen:name()
  output = output .. "\n" .. "Top left:       " .. frame.x .. ", " .. frame.y
  output = output .. "\n" .. "Top left ratio: " .. string.format("%.2f", (frame.x / current_screen:frame().w)) .. ", " .. string.format("%.2f", (frame.y / current_screen:frame().h))
  output = output .. "\n" .. "Bottom right:   " .. frame.x2 .. ", " .. frame.y2
  output = output .. "\n" .. "Bottom ratio:   " .. string.format("%.2f", (frame.x2 / current_screen:frame().w)) .. ", " .. string.format("%.2f", (frame.y2 / current_screen:frame().h))
  output = output .. "\n" .. "Window:         " .. frame.h .. ", " .. frame.w
  output = output .. "\n" .. "Screen          " .. current_screen:frame().h .. ", " .. current_screen:frame().w
  output = output .. "\n" .. "Is standard?    " .. tostring(last_checked_window:isStandard())
  output = output .. "\n" .. "Is maximizable? " .. tostring(last_checked_window:isMaximizable())
  output = output .. "\n" .. "Subrole:        " .. last_checked_window:subrole()
  output = output .. "\n" .. "Zoom button:    " .. zoomButtonRect.x .. ", " .. zoomButtonRect.y .. ", " .. zoomButtonRect.w .. ", " .. zoomButtonRect.h
  output = output .. "\n" .. "Chime meeting:  " .. tostring(isChimeMeetingWindow(last_checked_window))

  return output
end

hotkey.bind({"cmd", "alt", "ctrl"}, "W", function()
  local s = windowdetails()
  print(s)
  alert.show(s)
  -- notify.new({title="Hammerspoon", informativeText=s}):send()
end)

caffeinate.watcher.new(function(event)
  if event == caffeinate.watcher.screensDidLock then
    print("Caffeinate lock screen event")
    if os.date("*t", os.time())["hour"] >= 18 then
      print("It's late, stopping tasks")
      hs.execute("active-task.sh --stop", true)
      hs.execute("timew stop", true)
    end
  end
end)

local windowFilter = window.filter.new(false)
windowFilter:allowApp(amazon_chime)
windowFilter:subscribe({window.filter.windowCreated, window.filter.windowDestroyed}, onWindowEvent)
