
moduleString = moduleString .. "🕰️: Time\n"

function time()
    hs.alert.show("🕰️" .. os.date('%H:%M:%S', os.time()))
end

hs.hotkey.bind(hyper, "´", time)
hs.hotkey.bind(hyperNoShift, "´", time)


function timewarriorStatus()
    local handle = io.popen("/usr/local/bin/timew")
    local result = handle:read("*a")
    handle:close()
    if (string.match(result, "no active")) then
        hs.alert.show("🕰️: No active time tracking!")
    else
        hs.alert.show("🕰️: Currently tracking time...")
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
