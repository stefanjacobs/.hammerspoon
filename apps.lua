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
    t = 'Microsoft Teams',
    x = 'KeePassXC'
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
