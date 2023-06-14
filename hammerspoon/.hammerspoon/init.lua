function runOrFocus(name) 
    local launched = hs.application.launchOrFocus(name)
    if (not launched) then
        hs.alert.show(name .. " not found!")
    end
end

-- Creates a shortcut to quickly open the given application
function mapApplication(name, key)
    hs.hotkey.bind({"alt"}, key, function()
        local app = hs.appfinder.appFromName(name)
        if (name ~= nil) then
            -- If we found the app, let's check if it's already focused
            local window = app:focusedWindow()
            if (window ~= nil) then
                -- If it's not focused yet, let's run and focus on it
                runOrFocus(name)
            else
                -- Otherwise let's just focus on it.
                window:focus()
            end
        else
            -- Otherwise let's launch it
            runOrFocus(name)
        end
       
      end)
end

mapApplication("Firefox", "B")
mapApplication("Alacritty", "T")
mapApplication("Obsidian", "O")