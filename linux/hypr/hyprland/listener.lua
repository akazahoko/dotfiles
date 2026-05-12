----------------
---- HELPER ----
----------------

local function get_colsize(x)
    x = x / 2560
    if x < 0.4 then
        return 0.333
    elseif x < 0.6 then
        return 0.5
    elseif x < 0.8 then
        return 0.667
    else
        return 1.0
    end
end

----------------
---- EVENTS ----
----------------

-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Expanding-functionality/#events

hl.on("window.move_to_workspace", function()
    local size = hl.get_active_window().size
    hl.dispatch(hl.dsp.layout("colresize " .. get_colsize(size.x)))
end)