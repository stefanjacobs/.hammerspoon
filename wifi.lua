-- Tastaturkürzel "w" für WiFi

moduleString = moduleString .. "📶 - Wifi\n"

hs.hotkey.bind(hyper, "w", function()
    local network = hs.wifi.currentNetwork()
    local details = hs.wifi.interfaceDetails()
    hs.alert.show("📶: Connected to " .. network
                    .. "\n" .. "Transmit: " .. details.transmitRate .. " Mbps"
                    -- .. "\n" .. "Power: " .. details.transmitPower .. "mW"
                    -- .. "\n" .. "Noise: " .. details.noise .. " dBm"
                    -- .. "\n" .. "Channel Band: " .. details.wlanChannel.band
                    -- .. "\n" .. "Channel Nr: " .. details.wlanChannel.number
                    -- .. "\n" ..  "Channel Width: " .. details.wlanChannel.width
                )
end)

hs.hotkey.bind(hyperNoShift, "w", function()
    local network = hs.wifi.currentNetwork()
    local details = hs.wifi.interfaceDetails()
    hs.alert.show("📶: Connected to " .. network
                    .. "\n" .. "Transmit: " .. details.transmitRate .. " Mbps"
                    -- .. "\n" .. "Power: " .. details.transmitPower .. "mW"
                    -- .. "\n" .. "Noise: " .. details.noise .. " dBm"
                    -- .. "\n" .. "Channel Band: " .. details.wlanChannel.band
                    -- .. "\n" .. "Channel Nr: " .. details.wlanChannel.number
                    -- .. "\n" ..  "Channel Width: " .. details.wlanChannel.width
                )
end)

-- hs.wifi.currentNetwork