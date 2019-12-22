moduleString = moduleString .. "🔋 - Battery\n"

function battery()
    local percent = hs.battery.percentage()
    local charging = hs.battery.isCharging()
    local powerSource = hs.battery.powerSource()
    
    if (hs.battery.powerSource() == "AC Power" and charging == false) then
        hs.alert.show("🔋: AC Power and not charging (" .. percent .. "%)")
    end

    if (hs.battery.powerSource() == "AC Power" and charging) then
        hs.alert.show("🔋: AC Power and charging @" .. percent .. "%")
    end

    if (hs.battery.powerSource() == "Battery Power") then
        hs.alert.show("🔋: " .. percent .. "% remaining")
    end
end

hs.hotkey.bind(hyper, "b", battery)
hs.hotkey.bind(hyperNoShift, "b", battery)

-- hs.alert.show('Battery 🔋: Ready to rock 🤘!')