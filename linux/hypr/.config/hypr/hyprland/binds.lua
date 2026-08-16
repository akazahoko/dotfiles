---------------
---- BINDS ----
---------------

-- See https://wiki.hypr.land/Configuring/Basics/Binds/
-- See https://wiki.hypr.land/Configuring/Basics/Dispatchers/

-- Order: CTRL + ALT + SHIFT + SUPER + [KEY]

-----------------
---- WINDOWS ----
-----------------

-- Workspaces
for i = 1, 10 do
    local key = i % 10
    hl.bind("SUPER + " .. key, hl.dsp.focus({ workspace = i }))                                      -- Focus
    hl.bind("SHIFT + SUPER + " .. key, hl.dsp.window.move({ workspace = i }))                        -- Switch
    hl.bind("CTRL + SHIFT + SUPER + " .. key, hl.dsp.window.move({ workspace = i, follow = false })) -- Switch w/o Follow
end

hl.bind("SUPER + MINUS", hl.dsp.focus({workspace = "r-1"}))
hl.bind("SUPER + EQUAL", hl.dsp.focus({workspace = "r+1"}))

-- Special Workspaces
hl.bind("SUPER + GRAVE", hl.dsp.workspace.toggle_special({ special_name = "special" }))
hl.bind("SHIFT + SUPER + GRAVE", hl.dsp.window.move({ workspace = "special" }))

-- Drag / Resize Windows with Mouse
hl.bind("SUPER + mouse:272", hl.dsp.window.drag())
hl.bind("SUPER + mouse:273", hl.dsp.window.resize())

-- Fullscreen / Float / Pin
hl.bind("SUPER + F", hl.dsp.window.fullscreen())
hl.bind("F11", hl.dsp.window.fullscreen())
hl.bind("SHIFT + SUPER + F", hl.dsp.window.float())
hl.bind("SHIFT + SUPER + T", hl.dsp.window.pin())

----------------
---- Layout ----
----------------

local dirs = {
    { "UP",    "u" },
    { "DOWN",  "d" },
    { "LEFT",  "l" },
    { "RIGHT", "r" },

    { "K",     "u" },
    { "J",     "d" },
    { "H",     "l" },
    { "L",     "r" },
}

for _, arr in ipairs(dirs) do
    local key = arr[1]; local dir = arr[2]
    hl.bind("SUPER + " .. key, hl.dsp.focus({ direction = dir }))               -- Move Focus
    hl.bind("SHIFT + SUPER + " .. key, hl.dsp.window.move({ direction = dir })) -- Move Windows
end

-- Scrolling
local scroll_dirs = {
    { "COMMA",       "l" },
    { "PERIOD",      "r" },

    { "ALT + LEFT",  "l" },
    { "ALT + RIGHT", "r" },
}

for _, arr in ipairs(scroll_dirs) do
    local key = arr[1]; local dir = arr[2]
    hl.bind("SUPER + " .. key, hl.dsp.layout("focus " .. dir))           -- Move Column Focus
    hl.bind("SHIFT + SUPER + " .. key, hl.dsp.layout("swapcol " .. dir)) -- Swap Column
end

-- Resize Column
hl.bind("SUPER + R", hl.dsp.layout("colresize +conf"))
hl.bind("SHIFT + SUPER + R", hl.dsp.layout("colresize -conf"))

-- Scrolling with Mouse
hl.bind("SUPER + mouse_up", hl.dsp.layout("move -col"))
hl.bind("SUPER + mouse_down", hl.dsp.layout("move +col"))
hl.bind("SHIFT + SUPER + mouse_up", hl.dsp.focus({ workspace = "r-1" }))
hl.bind("SHIFT + SUPER + mouse_down", hl.dsp.focus({ workspace = "r+1" }))

--------------------------------
---- Applications / Scripts ----
--------------------------------

hl.bind("SUPER + Q", hl.dsp.window.close())
hl.bind("SHIFT + SUPER + Q", hl.dsp.window.kill())

DMENU_DIR = "~/.local/bin/menus/"
OSD_DIR = "~/.local/bin/osd/"

local app_binds = {
    { "SUPER + B",             "firefox" },
    { "SUPER + E",             "dolphin" },
    { "SUPER + T",             "foot" },
    { "SUPER + SPACE",         "fuzzel" },
    { "SUPER + XF86AudioMute", "pavucontrol" },
    { "CTRL + SHIFT + ESCAPE", "foot -a btop btop" },
}

for _, item in ipairs(app_binds) do
    hl.bind(item[1], hl.dsp.exec_cmd(item[2]))
end

local script_binds = {
    -- Script Launcher
    { "CTRL + SUPER + SPACE",        "launcher" },

    -- Capturing / Screenshots
    { "SHIFT + SUPER + S",           "capture",      "region" },
    { "CTRL + SHIFT + SUPER + S",    "capture" },

    -- Package managers
    { "SUPER + P",                   "pacman" },

    -- Palette
    { "SUPER + V",                   "palette",      "clipboard" },
    { "CTRL + SUPER + V",            "palette" },

    -- Power Options
    { "CTRL + ALT + DELETE",         "power" },
    { "CTRL + ALT + L",              "power",        "toggle_inhibitor" },

    -- Quick Toggles
    { "SUPER + ESCAPE",              "quicktoggle" },

    -- Reload Modules
    { "SUPER + F5",                  "reloader",     "reload_waybar" },

    -- Volume Control (Sink)
    { "XF86AudioRaiseVolume",        "mediacontrol", "vol_sink_up" },
    { "XF86AudioLowerVolume",        "mediacontrol", "vol_sink_down" },
    { "XF86AudioMute",               "mediacontrol", "vol_sink_mute" },

    -- Volume Control (Source)
    { "CTRL + XF86AudioRaiseVolume", "mediacontrol", "vol_src_up" },
    { "CTRL + XF86AudioLowerVolume", "mediacontrol", "vol_src_down" },
    { "CTRL + XF86AudioMute",        "mediacontrol", "vol_src_mute" },

    -- Multimedia Control
    { "XF86AudioPlay",               "mediacontrol", "media_playpause" },
    { "XF86AudioNext",               "mediacontrol", "media_next" },
    { "XF86AudioPrev",               "mediacontrol", "media_prev" },

    -- Monitor Brightness Control (DDC/CI)
    { "XF86MonBrightnessUp",         "brightness",   "ddc_up" },
    { "XF86MonBrightnessDown",       "brightness",   "ddc_down" },
}

for _, item in ipairs(script_binds) do
    local cmd = DMENU_DIR .. item[2] .. "/dmenu.sh"
    if item[3] and item[3] ~= "" then
        cmd = cmd .. " " .. item[3]
    end
    hl.bind(item[1], hl.dsp.exec_cmd(cmd))
end

-- Monitor
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
