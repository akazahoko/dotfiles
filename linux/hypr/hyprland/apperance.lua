local colors = require("themes.catppuccin_mocha")

hl.config({

    -- General
    -- See https://wiki.hypr.land/Configuring/Basics/Variables/#general

    general = {
        border_size = 0,
        gaps_in = 10,
        gaps_out = 20,
        ["col.active_border"] = colors.active_border_color,
        ["col.inactive_border"] = colors.inactive_border_color,
    },

    -- Decoration
    -- See https://wiki.hypr.land/Configuring/Basics/Variables/#decoration

    decoration = {
        rounding = 0,
        rounding_power = 2,
        active_opacity = 1.0,
        inactive_opacity = 0.9,

        dim_around = 0.5,
        dim_special = 0.5,

        blur = {
            enabled = true,
            size = 5,
            passes = 3,
        },

        shadow = {
            enabled      = false,
            range        = 2,
            render_power = 1,
            color        = colors.surface0,
        },
    },
})

--------------------
---- ANIMATIONS ----
--------------------

-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Animations/

-- Bezier
-- See https://www.cssportal.com/css-cubic-bezier-generator/
-- See https://easings.net/

local beziers = {
    { "almostLinear",   { { 0.5, 0.5 }, { 0.75, 1 } } },
    { "easeInOutCubic", { { 0.65, 0.05 }, { 0.36, 1 } } },
    { "easeInOutQuint", { { 0.83, 0 }, { 0.17, 1 } } },
    { "easeOutBack",    { { 0.34, 1.18 }, { 0.64, 1 } } },
    { "easeOutCirc",    { { 0, 0.55 }, { 0.45, 1 } } },
    { "easeOutCubic",   { { 0.33, 1 }, { 0.68, 1 } } },
    { "easeOutExpo",    { { 0.16, 1 }, { 0.3, 1 } } },
    { "easeOutQuart",   { { 0.25, 1 }, { 0.5, 1 } } },
    { "easeOutQuint",   { { 0.22, 1 }, { 0.36, 1 } } },
    { "linear",         { { 0, 0 }, { 1, 1 } } },
    { "quick",          { { 0.15, 0 }, { 0.1, 1 } } },
}

for _, bezier in ipairs(beziers) do hl.curve(bezier[1], { type = "bezier", points = bezier[2] }) end

-- Spring

hl.curve("easy", { type = "spring", mass = 1, stiffness = 71.2633, dampening = 15.8273644 })

-- Animations

hl.animation({ leaf = "windows", enabled = true, speed = 3, bezier = "easeOutBack" })
hl.animation({ leaf = "fade", enabled = true, speed = 7, bezier = "easeOutExpo" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 3, bezier = "easeOutBack", style = "slidevert" })
hl.animation({ leaf = "specialWorkspaceIn", enabled = true, speed = 3, bezier = "easeOutQuint", style = "slidevert top" })
hl.animation({
    leaf = "specialWorkspaceOut",
    enabled = true,
    speed = 3,
    bezier = "easeOutQuint",
    style =
    "slidevert bottom"
})
