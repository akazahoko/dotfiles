-- .config/hypr/hyprland.lua
hl.config({
    plugin = {
        scrolloverview = {
            gesture_distance = 300, -- how far is the "max" for the gesture
            scale = 0.6,           -- preferred overview scale
            workspace_gap = 50,
            layout = "vertical",    -- vertical, horizontal, or auto (per-monitor orientation)
            wallpaper = 2,          -- 0: global only, 1: per-workspace only, 2: both
            blur = true,            -- blur only the main overview wallpaper

            shadow = {
                enabled = true,
                range = 20,
            },
        },
        100
    },
})

-- Toggle ScrollOverview with SUPER+g
hl.bind("SUPER + TAB", function()
    hl.plugin.scrolloverview.overview("toggle all")
end)

-- Gestures
hl.plugin.scrolloverview.gesture({ fingers = 4, direction = "pinch" })
-- hl.plugin.scrolloverview.gesture({ fingers = 5, direction = "vertical", mod = "SUPER", scale = 1.5 })
-- hl.plugin.scrolloverview.gesture({ fingers = 3, direction = "vertical", disable_inhibit = true })
-- hl.plugin.scrolloverview.gesture({ fingers = 3, direction = "vertical", action = "unset" })