hl.bind("SHIFT + SUPER + F1", function()
    local state = hl.get_monitor("HDMI-A-1")
    local isDisabled = false

    if state ~= nil then
        isDisabled = true
    end

    hl.monitor({
        output = "HDMI-A-1",
        disabled = isDisabled
    })
end)