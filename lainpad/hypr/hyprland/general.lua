---------------
---- INPUT ----
---------------

-- See https://wiki.hypr.land/Configuring/Basics/Variables/#input

hl.config({
    input = {
        -- Keyboard
        kb_layout = "us",
        kb_variant = "",
        kb_model = "",
        kb_options = "rr",
        kb_rules = "",
        numlock_by_default = true,

        -- Mouse
        follow_mouse = true,
        force_no_accel = false,
        scroll_factor = true,
        accel_profile = "adaptive",

        touchpad = {
            natural_scroll = true,
            drag_3fg = 1,
        },
    },

    --------------
    ---- MISC ----
    --------------

    -- See https://wiki.hypr.land/Configuring/Basics/Variables/#misc

    misc = {
        -- enable_swallow = true,
        -- swallow_regex = "^(foot|kitty|st)$",
        disable_hyprland_logo = true,
        vrr = 2,
    },

    binds = {
        scroll_event_delay = 0,
        workspace_back_and_forth = false,
        allow_pin_fullscreen = true,
    },
})

------------------
---- MONITORS ----
------------------

-- See https://wiki.hypr.land/Configuring/Basics/Monitors/

hl.monitor({
    output = "eDP-1",
    mode = "2880x1800@120",
    position = "0x0",
    scale = "1.25",
})
