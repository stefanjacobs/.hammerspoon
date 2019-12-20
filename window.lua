moduleString = moduleString .. "🖥️ - Window\n"

log = hs.logger.new('Window','debug')

windowLastAction = "none"
windowLastLayout = "none"

hs.window.animationDuration = 0.3

-- move left
hs.hotkey.bind(hyper, "h", function()
    local win = hs.window.focusedWindow();
    if not win then return end

    if (windowLastAction == "left" and windowLastLayout == hs.layout.left50) then
        -- log.i("left 50->30")
        win:moveToUnit(hs.layout.left30)
        windowLastLayout=hs.layout.left30
    elseif (windowLastAction == "left" and windowLastLayout == hs.layout.left30) then
        -- log.i("left 30->70")
        win:moveToUnit(hs.layout.left70)
        windowLastLayout=hs.layout.left70
    else
        -- log.i("left ?->50")
        win:moveToUnit(hs.layout.left50)
        windowLastLayout=hs.layout.left50
    end
    windowLastAction = "left"
end)

-- move right
hs.hotkey.bind(hyper, "l", function()
    local win = hs.window.focusedWindow();
    if not win then return end

    if (windowLastAction == "right" and windowLastLayout == hs.layout.right50) then
        -- log.i("right 50->30")
        win:moveToUnit(hs.layout.right30)
        windowLastLayout=hs.layout.right30
    elseif (windowLastAction == "right" and windowLastLayout == hs.layout.right30) then
        -- log.i("right 30->70")
        win:moveToUnit(hs.layout.right70)
        windowLastLayout=hs.layout.right70
    else
        -- log.i("right ?->50")
        win:moveToUnit(hs.layout.right50)
        windowLastLayout=hs.layout.right50
    end
    windowLastAction = "right"
end)

-- move maximize
hs.hotkey.bind(hyper, "k", function()
    local win = hs.window.focusedWindow();
    if not win then return end
    --win:moveToUnit(hs.layout.maximized)
    win:maximize()
    windowLastAction = "up"
end)

-- move minimize 
hs.hotkey.bind(hyper, "j", function()
    local win = hs.window.focusedWindow();
    if not win then return end
    win:minimize()
    windowLastAction = "down"
end)

-- close window
hs.hotkey.bind(hyper, "c", function()
    local win = hs.window.focusedWindow();
    if not win then return end
    win:close()
    windowLastAction = "close"
end)

-- Fullscreen 
hs.hotkey.bind(hyper, "z", function()
    local win = hs.window.focusedWindow();
    if not win then return end
    win:toggleFullScreen() -- works better than toggleZoom()!
    windowLastAction = "fullscreen"
end)

-- Next Screen (not tested)
hs.hotkey.bind(hyper, "n", function()
    local win = hs.window.focusedWindow();
    if not win then return end
    win:moveToScreen(win:screen():next())
    windowLastAction = "next screen"
end)

-- hs.alert.show('Window 🖥️: Ready to rock 🤘!')
