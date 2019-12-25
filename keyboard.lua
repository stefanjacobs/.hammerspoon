moduleString = moduleString .. "Keyboard\n"

function testKeyboard()
    local source = hs.keycodes.currentSourceID()
    hs.alert.show("Current layout is " .. source)
end

hs.hotkey.bind(hyper, "1", testKeyboard)