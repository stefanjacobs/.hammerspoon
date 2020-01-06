
moduleString = moduleString .. "🕰️: Time\n"

function time()
    hs.alert.show("🕰️" .. os.date('%H:%M:%S', os.time()))
end

hs.hotkey.bind(hyper, "-", time)
hs.hotkey.bind(hyperNoShift, "-", time)