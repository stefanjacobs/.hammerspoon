
moduleString = moduleString .. "🕰️: Time\n"

function time()
    hs.alert.show("🕰️" .. os.date('%H:%M:%S', os.time()))
end

hs.hotkey.bind(hyper, "´", time)
hs.hotkey.bind(hyperNoShift, "´", time)

function ltrim(s)
    return s:match'^%s*(.*)'
end

function timewarriorStatus()
    local handle = io.popen("/usr/local/bin/timew")
    local result = handle:read("*a")
    handle:close()
    if (string.match(result, "no active")) then
        hs.alert.show("🕰️: No active time tracking!")
    else
        -- hs.alert.show(result)
        lines = {}
        for s in result:gmatch("[^\r\n]+") do
            table.insert(lines, s)
        end
        local ts = ltrim(lines[2])
        ts = string.sub(ts, 20)
        hs.alert.show("🕰️: Tracking since " .. ts )
    end
end

hs.hotkey.bind(hyperNoShift, "-", timewarriorStatus)
hs.hotkey.bind(hyper, "-", timewarriorStatus)


function timewarriorToggle()
    local handle = io.popen("~/bin/tw.sh")
    local result = handle:read("*a")
    handle:close()
    if (string.match(result, "STOPPING")) then
        hs.alert.show("🕰️: 🛑 Stop tracking")
    else
        hs.alert.show("🕰️: 🎬 Start tracking")
    end
end

hs.hotkey.bind(hyperNoShift, "+", timewarriorToggle)
hs.hotkey.bind(hyper, "+", timewarriorToggle)


local function rememberToDrink()
    -- hs.notify.new({title='Hammerspoon', informativeText='Remember to drink?'}):send()
    -- hs.alert.show("Remember to drink?", hs.alert.defaultStyle, hs.screen.mainScreen(), "indev")
    -- hs.alert.show("Hello from Hammerspoon!")
    hs.notify.new({title="Hammerspoon", informativeText="Remember to drink", withdrawAfter=0}):send()
end

local function startUpdatingClockingMenu()
    hs.timer.doEvery(60*30, rememberToDrink)
--    hs.timer.doEvery(10, rememberToDrink)
end

startUpdatingClockingMenu()