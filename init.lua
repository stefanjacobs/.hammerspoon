
hyper = { "cmd", "alt", "ctrl", "shift" }
hyperNoShift = { "cmd", "alt", "ctrl"}
moduleString = "\n"

-- hs.loadSpoon('ControlEscape'):start()
hs.loadSpoon('SpeedMenu'):start()
-- hs.loadSpoon('TimeMachineProgress'):start()
require('battery') -- hyper-b 
require('reload') -- hyper-0
require('apps') -- hyper -> and many buttons
require('window') -- hyper-hjkl z n c
require('wifi') -- hyper-w
require('vendosecret') -- hyper- .,
require('time') -- hyper- -,+,´ 
require('mic') -- hyper-m
-- local log = hs.logger.new('init.lua', 'debug')

-- keyUpDown = function(modifiers, key)
--     -- Un-comment & reload config to log each keystroke that we're triggering
--     log.d('Sending keystroke:', hs.inspect(modifiers), key)
--     hs.eventtap.keyStroke(modifiers, key, 0)
-- end |

-- hs.notify.new({title='Hammerspoon', informativeText='Ready to rock 🤘'}):send()
hs.alert.show("🔨🥄 - Hammerspoon\nModules: " .. moduleString .. "🤘🤘Ready to rock🤘🤘")
