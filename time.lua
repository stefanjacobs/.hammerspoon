
moduleString = moduleString .. "🕰️: Time\n"

function time()
    hs.alert.show("🕰️" .. os.date('%H:%M:%S', os.time()))
end

hs.hotkey.bind(hyper, "´", time)
hs.hotkey.bind(hyperNoShift, "´", time)


function timewarriorStatus()
    local handle = io.popen("/usr/local/bin/timew summary")
    local result = handle:read("*a")
    handle:close()
    hs.alert.show(result) -- TODO: Pretty format
end

hs.hotkey.bind(hyperNoShift, "-", timewarriorStatus)
hs.hotkey.bind(hyper, "-", timewarriorStatus)


function timewarriorToggle()
    local handle = io.popen("~/bin/tw.sh")
    local result = handle:read("*a")
    handle:close()
    hs.alert.show(result) -- TODO: Pretty format
end

hs.hotkey.bind(hyperNoShift, "+", timewarriorToggle)
hs.hotkey.bind(hyper, "+", timewarriorToggle)
