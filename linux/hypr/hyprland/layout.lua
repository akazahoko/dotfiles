----------------
---- LAYOUT ----
----------------

-- See https://wiki.hypr.land/Configuring/Layouts/

hl.config({

    general = { layout = "scrolling" },

    -- Dwindle
    -- See https://wiki.hypr.land/Configuring/Layouts/Dwindle-Layout/
    
    dwindle = {
        preserve_split = true,
    },

    -- Master
    -- See https://wiki.hypr.land/Configuring/Layouts/Master-Layout/

    master = {
        new_status = "master",
    },

    -- Scrolling
    -- See https://wiki.hypr.land/Configuring/Layouts/Scrolling-Layout/

    scrolling = {
        fullscreen_on_one_column = false,
        follow_focus = false,
    },
})