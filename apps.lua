-- Application shortcuts 
moduleString = moduleString .. "📌 - Apps\n"

-- Hotkeys that search for an app when combined with Hyper
local applicationHotkeys = {
    f = 'Finder',
    a = 'Activity Monitor',
    g = 'Google Chrome',
    i = 'iTerm',
    s = 'Safari',
    v = 'Visual Studio Code',
    o = 'Microsoft Outlook',
    e = 'Microsoft Excel',
    p = 'Preview',
    t = 'Microsoft Teams (work or school)',
    x = 'KeePassXC',
    u = 'Obsidian'
}

-- Register Hyper + Key to Launch or Focus the given app
for key, app in pairs(applicationHotkeys) do
    hs.hotkey.bind(hyper, key, function()
        hs.notify.new({title="Hammerspoon", informativeText="📌 " .. app, withdrawAfter=1}):send()
        hs.application.launchOrFocus(app)
    end)
    hs.hotkey.bind(hyperNoShift, key, function()
        hs.notify.new({title="Hammerspoon", informativeText="📌 " .. app, withdrawAfter=1}):send()
        hs.application.launchOrFocus(app)
    end)
end

-- hs.alert.show('Apps 📌: Ready to rock 🤘!')

local function pairsByKeys (t, f)
    local a = {}
    for n in pairs(t) do table.insert(a, n) end
    table.sort(a, f)
    local i = 0      -- iterator variable
    local iter = function ()   -- iterator function
        i = i + 1
        if a[i] == nil then return nil
        else return a[i], t[a[i]]
        end
    end
    return iter
end

function appHelp()
    msg = ""
    for key, app in pairsByKeys(applicationHotkeys) do
        msg = msg .. key .. ":\t" .. app .. "\n"
    end
    hs.alert.show(msg, 5)
end

hs.hotkey.bind(hyper, "ß", appHelp)
hs.hotkey.bind(hyperNoShift, "ß", appHelp)
