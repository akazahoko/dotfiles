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
        force_no_accel = true,
        scroll_factor = true,
    },

    --------------
    ---- MISC ----
    --------------

    -- See https://wiki.hypr.land/Configuring/Basics/Variables/#misc

    misc = {
        -- enable_swallow = true,
        -- swallow_regex = "^(foot|kitty|st)$",
        disable_hyprland_logo = true,
        mouse_move_enables_dpms = true,
        key_press_enables_dpms = true,
        initial_workspace_tracking = 2,
    },

    binds = {
        scroll_event_delay = 0,
        workspace_back_and_forth = false,
        allow_pin_fullscreen = true,
    },
})