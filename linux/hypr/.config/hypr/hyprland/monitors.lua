------------------
---- MONITORS ----
------------------

-- See https://wiki.hypr.land/Configuring/Basics/Monitors/

hl.monitor({
    output = "DP-1",
    mode = "2560x1440@165",
    position = "0x0",
    scale = "1",
})

hl.monitor({
    output = "HDMI-A-1",
    mode = "1920x1080@60",
    position = "2560x-240",
    transform = 3
})

for i = 1, 5 do
    hl.workspace_rule({
        workspace = tostring(i),
        monitor = "DP-1",
        animation = "slidevert"
    })
end

for i = 6, 10 do
    hl.workspace_rule({
        workspace = tostring(i),
        monitor = "HDMI-A-1",
        animation = "slide",
        layout_opts = { direction = "down" },
    })
end

hl.workspace_rule({
    workspace = "1",
    default = true
})