moduleString = moduleString .. "🔋 - Battery\n"

hs.hotkey.bind(hyper, "b", function()
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
end)

-- hs.hotkey.bind(hyper, "b", function()
--     local battery_remaining = hs.battery.timeRemaining()
    
--     if (battery_remaining == -2) then
--         hs.alert.show("🔋 - You are on power, stupid")
--     elseif (battery_remaining == -1) then
--         hs.alert.show("🔋 - Still calculating remaining time...")
--     else
--         hs.alert.show("🔋 - Battery Remaining: " .. battery_remaining .. " minutes.")
--     end
-- end)

-- hs.hotkey.bind(hypershift, "b", function()
--     local time_to_full = hs.battery.timeToFullCharge()
    
--     if (time_to_full == -1) then
--         hs.alert.show("🔋 - Still calculating remaining time...")
--     else
--         hs.alert.show("🔋 - Time to full charge again: " .. time_to_full .. " minutes.")
--     end
-- end)


-- hs.alert.show('Battery 🔋: Ready to rock 🤘!')