local colors = require("themes.catppuccin_mocha")

hl.config({

    -- General
    -- See https://wiki.hypr.land/Configuring/Basics/Variables/#general

    general = {
        border_size = 3,

        gaps_in = 5,
        gaps_out = 10,
    },

    -- Decoration
    -- See https://wiki.hypr.land/Configuring/Basics/Variables/#decoration

    decoration = {
        rounding = 0,
        rounding_power = 2,
        active_opacity = 1.0,
        inactive_opacity = 1.0,

        blur = {
            enabled = true,
            size = 5,
            passes = 3,
        },

        shadow = {
            enabled      = true,
            range        = 3,
            render_power = 1,
            color        = colors.surface0,
        }
    }
})

--------------------
---- ANIMATIONS ----
--------------------

-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Animations/

-- Bezier
-- See https://www.cssportal.com/css-cubic-bezier-generator/
-- See https://easings.net/

hl.curve("easeOutQuint", { type = "bezier", points = { { 0.22, 1 }, { 0.36, 1 } } })
hl.curve("easeOutCubic", { type = "bezier", points = { { 0.33, 1 }, { 0.68, 1 } } })
hl.curve("easeOutCirc", { type = "bezier", points = { { 0, 0.55 }, { 0.45, 1 } } })
hl.curve("easeOutExpo", { type = "bezier", points = { { 0.16, 1 }, { 0.3, 1 } } })
hl.curve("easeOutBack", { type = "bezier", points = { { 0.34, 1.18 }, { 0.64, 1 } } })
hl.curve("easeOutQuart", { type = "bezier", points = { { 0.25, 1 }, { 0.5, 1 } } })

hl.curve("easeInOutCubic", { type = "bezier", points = { { 0.65, 0.05 }, { 0.36, 1 } } })
hl.curve("easeInOutQuint", { type = "bezier", points = { { 0.83, 0 }, { 0.17, 1 } } })

hl.curve("linear", { type = "bezier", points = { { 0, 0 }, { 1, 1 } } })
hl.curve("almostLinear", { type = "bezier", points = { { 0.5, 0.5 }, { 0.75, 1 } } })
hl.curve("quick", { type = "bezier", points = { { 0.15, 0 }, { 0.1, 1 } } })

-- Spring

hl.curve("easy", { type = "spring", mass = 1, stiffness = 71.2633, dampening = 15.8273644 })

-- Animations

hl.animation({ leaf = "windows", enabled = true, speed = 4.5, bezier = "easeOutBack", style = "popin" })

hl.animation({ leaf = "fade", enabled = true, speed = 7, bezier = "easeOutExpo" })

hl.animation({ leaf = "workspaces", enabled = true, speed = 8, bezier = "easeOutQuint", style = "slidevert" })
hl.animation({ leaf = "specialWorkspace", enabled = true, speed = 8, bezier = "easeOutQuint", style = "fade" })
