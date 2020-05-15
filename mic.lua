-- Tastaturkürzel "m" für Mic

moduleString = moduleString .. "🎙️ - Mic\n"

function micToggle()
    local micDevice = hs.audiodevice.defaultInputDevice()
    if (micDevice:inputMuted()) then
        -- unmute
        micDevice:setInputMuted(false)
        hs.alert.show("️🎙️ - Mic: Active! ⚡")
    else
        -- mute
        micDevice:setInputMuted(true)
        hs.alert.show("🔇 - Mic: Muted 🤫")
    end
end

hs.hotkey.bind(hyperNoShift, "m", micToggle)
hs.hotkey.bind(hyper, "m", micToggle)