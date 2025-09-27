local log = hs.logger.new("hammerspoon-config", "debug")

function runOrFocus(name)
	local launched = hs.application.launchOrFocus(name)
	if not launched then
		hs.alert.show(name .. " not found!")
	end
end

function moveMouseToFocusedWindow()
	local window = hs.window.focusedWindow()
	if window == nil then
		hs.alert.show("No focused window, can't move mouse.")
		return
	end

	local screen = window:screen()
	if screen == nil then
		hs.alert.show("No screen found for window" .. window .. ", can't move mouse.")
		return
	end

	local frame = screen:frame()
	if frame == nil then
		hs.alert.show("No frame found for screen" .. screen .. ", can't move mouse.")
		return
	end

	local position = {
		y = frame.h / 2,
		x = frame.w / 2,
	}
	log.i("Moving to x: " .. position.x .. " and y: " .. position.y .. " in screen: " .. tostring(screen))
	hs.mouse.setRelativePosition(position, screen)
end

-- Creates a shortcut to quickly open the given application
function mapApplication(name, key)
	hs.hotkey.bind({ "alt" }, key, function()
		runOrFocus(name)
		moveMouseToFocusedWindow()
	end)
end

hs.hotkey.bind({ "alt" }, "R", function()
	hs.reload()
end)

hs.hotkey.bind({ "alt", "shift" }, "R", function()
	local window = hs.window.focusedWindow()
	if window ~= nil then
		window:toggleFullScreen()
	else
		hs.alert.show("No focused window, can't toggle full screen.")
	end
end)

-- Prefer using Firefox if it's installed (ideally we should grab the default browser from the config)
BROWSER = "Google Chrome"
if hs.application.infoForBundlePath("/Applications/Firefox.app") ~= nil then
	BROWSER = "Firefox"
end

mapApplication("Slack", "S")
mapApplication("GoLand", "G")
mapApplication("IntelliJ IDEA", "I")
mapApplication("Postman", "P")
mapApplication(BROWSER, "B")
mapApplication("Ghostty", "T")
mapApplication("Obsidian", "O")

hs.alert.show("Config reloaded")
