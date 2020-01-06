moduleString = moduleString .. "🖥️ - Window\n"

log = hs.logger.new('Window','debug')

windowLastAction = "none"
windowLastLayout = "none"

hs.window.animationDuration = 0.3

-- move left
function moveLeft()
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
end
hs.hotkey.bind(hyper, "h", moveLeft)
hs.hotkey.bind(hyperNoShift, "h", moveLeft)

-- move right
function moveRight()
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
end
hs.hotkey.bind(hyper, "l", moveRight)
hs.hotkey.bind(hyperNoShift, "l", moveRight)

-- move maximize
function maximize()
    local win = hs.window.focusedWindow();
    if not win then return end
    win:maximize()
    windowLastAction = "up"
end
hs.hotkey.bind(hyper, "k", maximize)
hs.hotkey.bind(hyperNoShift, "k", maximize)

-- move minimize 
function minimize()
    local win = hs.window.focusedWindow();
    if not win then return end
    win:minimize()
    windowLastAction = "down"
end
hs.hotkey.bind(hyper, "j", minimize)
hs.hotkey.bind(hyperNoShift, "j", minimize)

-- close window
function close()
    local win = hs.window.focusedWindow();
    if not win then return end
    win:close()
    windowLastAction = "close"
end
hs.hotkey.bind(hyper, "c", close)
hs.hotkey.bind(hyperNoShift, "c", close)

-- Fullscreen 
function fullscreen()
    local win = hs.window.focusedWindow();
    if not win then return end
    win:toggleFullScreen() -- works better than toggleZoom()!
    windowLastAction = "fullscreen"
end
hs.hotkey.bind(hyper, "z", fullscreen)
hs.hotkey.bind(hyperNoShift, "z", fullscreen)

-- Next Screen (not tested)
function nextscreen()
    local win = hs.window.focusedWindow();
    if not win then return end

    local fullscreen = win:isFullScreen()
    if fullscreen then 
        win:toggleFullScreen()
    end
    win:moveToScreen(win:screen():next(), false, true, 1.0)
    if fullscreen then
        hs.timer.doAfter(1.0, function()
            win:toggleFullScreen()
        end)
    end
    windowLastAction = "next screen"
end
hs.hotkey.bind(hyper, "n", nextscreen)
hs.hotkey.bind(hyperNoShift, "n", nextscreen)

function moveWindowToDisplay(d)
    return function()
        local displays = hs.screen.allScreens()
        local win = hs.window.focusedWindow()
        if not win then return end

        local fullscreen = win:isFullScreen()
        if fullscreen then 
            win:toggleFullScreen()
        end
        win:moveToScreen(displays[d], false, true)
        if fullscreen then
            hs.timer.doAfter(1.0, function()
                win:toggleFullScreen()
            end)
        end
        windowLastAction = "next screen"
    end
end

hs.hotkey.bind(hyperNoShift, "1", moveWindowToDisplay(1))
hs.hotkey.bind(hyperNoShift, "2", moveWindowToDisplay(2))
hs.hotkey.bind(hyperNoShift, "3", moveWindowToDisplay(3))
hs.hotkey.bind(hyper, "1", moveWindowToDisplay(1))
hs.hotkey.bind(hyper, "2", moveWindowToDisplay(2))
hs.hotkey.bind(hyper, "3", moveWindowToDisplay(3))

-- hs.alert.show('Window 🖥️: Ready to rock 🤘!')
