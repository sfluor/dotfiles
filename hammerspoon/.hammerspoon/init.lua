function runOrFocus(name)
    local launched = hs.application.launchOrFocus(name)
    if (not launched) then
        hs.alert.show(name .. " not found!")
    end
end

-- Creates a shortcut to quickly open the given application
function mapApplication(name, key)
    hs.hotkey.bind({ "alt" }, key, function()
        runOrFocus(name)
    end)
end

hs.hotkey.bind({ "alt" }, "R", function()
    hs.reload()
end)

hs.hotkey.bind({ "alt", "shift" }, "M", function()
    local window = hs.window.focusedWindow()
    if (window ~= nil) then
        window:toggleFullScreen()
    else
        hs.alert.show("No focused window, can't toggle full screen.")
    end
end)

-- Prefer using Firefox if it's installed (ideally we should grab the default browser from the config)
BROWSER = "Google Chrome"
if (hs.application.infoForBundlePath("/Applications/Firefox.app") ~= nil) then
    BROWSER = "Firefox"
end

mapApplication("GoLand", "G")
mapApplication("IntelliJ IDEA CE", "I")
mapApplication("Postman", "P")
mapApplication(BROWSER, "B")
mapApplication("Alacritty", "T")
mapApplication("Obsidian", "O")

hs.alert.show("Config reloaded")
