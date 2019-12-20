
hyper = { "cmd", "alt", "ctrl", "shift" }
-- hypershift = { "cmd", "alt", "ctrl", "shift" }
moduleString = "\n"

-- hs.loadSpoon('ControlEscape'):start()
-- moduleString = moduleString .. "⌨️ - ControlEscape\n"
require('battery') -- hyper-b 
require('reload') -- hyper-0
require('apps') -- hyper -> and many buttons
require('window') -- hyper-hjkl z n c
require('wifi') -- hyper-w




-- local log = hs.logger.new('init.lua', 'debug')

-- keyUpDown = function(modifiers, key)
--     -- Un-comment & reload config to log each keystroke that we're triggering
--     log.d('Sending keystroke:', hs.inspect(modifiers), key)
--     hs.eventtap.keyStroke(modifiers, key, 0)
-- end



-- hs.notify.new({title='Hammerspoon', informativeText='Ready to rock 🤘'}):send()
hs.alert.show("🔨🥄 - Hammerspoon\nModules: " .. moduleString .. "🤘🤘Ready to rock🤘🤘")


-- modal = hs.hotkey.modal.new( {}, 'f20' );

-- Space
-- modal:bind( '', 'b', function() modal.triggered = true; space:disable(); hs.eventtap.keyStroke( {}, 'space' ); space:enable() end, nil, function() space:disable(); hs.eventtap.keyStroke( {}, 'space' ); space:enable() end )

-- function modal:entered() hs.alert.closeAll(); hs.alert.show( "Vim mode active", 999999 ) end
-- function modal:exited() hs.alert.closeAll() end


-- -- Enter Hyper Mode when Spacebar is pressed
-- pressedSpace = function()
--   hs.alert.closeAll()
--   hs.alert.show( "HYPER active", 999999 ) 
--   modal.triggered = false
--   modal:enter()
-- end

-- -- Leave Hyper Mode when Spacebar is pressed,
-- --   send space if no other keys are pressed.
-- releasedSpace = function()
--   hs.alert.closeAll()
--   modal:exit()
--   if not modal.triggered then
--   	space:disable() -- hs seems to be triggered by his onw keyStroke, so needs to be disables before we can emit the space
--     hs.eventtap.keyStroke( {}, 'space' )
--     space:enable()
--   end
-- end

-- -- Main binding on spacebar
-- --  space = hs.hotkey.bind( {}, 'space', pressedSpace, releasedSpace )

-- -- Reload config with 'i'
-- hs.hotkey.bind(modal, "0", function()
--   hs.reload()
-- end)
-- hs.notify.new({title="Hammerspoon", informativeText="Config loaded"}):send()hs.loadSpoon('ControlEscape'):start() -- Load Hammerspoon bits from https://github.com/jasonrudolph/ControlEscape.spoon
