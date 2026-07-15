---------------
---- BINDS ----
---------------

-- See https://wiki.hypr.land/Configuring/Basics/Binds/
-- See https://wiki.hypr.land/Configuring/Basics/Dispatchers/

-- Order: CTRL + ALT + SHIFT + SUPER + [KEY]

-- Variables

SCRIPT_DIR = "~/Scripts"
DMENU_DIR = SCRIPT_DIR .. "/.dmenu"
OSD_DIR = SCRIPT_DIR .. "/.osd"

local directions = {
    -- Arrow Keys
    UP = "up",
    DOWN = "down",
    LEFT = "left",
    RIGHT = "right",

    -- VIM Keys
    K = "up",
    J = "down",
    H = "left",
    L = "right",
}

-- Helper

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

local function move_to_workspace(i)
    if hl.get_active_window() == nil then return end
    local size = hl.get_active_window().size
    hl.dispatch(hl.dsp.window.move({ workspace = i }))
    if layout == "scrolling" then
        hl.dispatch(hl.dsp.layout("colresize " .. get_colsize(size.x)))
    end
end

-- Workspaces

for i = 1, 10 do
    local key = i % 10
    hl.bind("SUPER + " .. key, hl.dsp.focus({ workspace = i }))                                      -- focus
    hl.bind("SHIFT + SUPER + " .. key, function() move_to_workspace(i) end)                          -- switch
    hl.bind("CTRL + SHIFT + SUPER + " .. key, hl.dsp.window.move({ workspace = i, follow = false })) -- switch w/o follow
end

hl.bind("SUPER + GRAVE", hl.dsp.workspace.toggle_special({ special_name = "special" }))
hl.bind("SHIFT + SUPER + GRAVE", function()
    if hl.get_active_special_workspace() == nil then
        move_to_workspace("special")
    else
        move_to_workspace("1")
    end
end)

hl.bind("SUPER + mouse:272", hl.dsp.window.drag())
hl.bind("SUPER + mouse:273", hl.dsp.window.resize())

hl.bind("SUPER + F", hl.dsp.window.fullscreen())
hl.bind("F11", hl.dsp.window.fullscreen())
hl.bind("SHIFT + SUPER + F", hl.dsp.window.float())
hl.bind("SHIFT + SUPER + T", hl.dsp.window.pin())

-- Dwindle Layout

if layout == "dwindle" then
    hl.bind("SUPER + mouse_up", hl.dsp.focus({ workspace = "e+1" }))
    hl.bind("SUPER + mouse_down", hl.dsp.focus({ workspace = "e-1" }))

    for key, dir in pairs(directions) do
        hl.bind("SUPER + " .. key, hl.dsp.focus({ direction = dir }))
        hl.bind("SHIFT + SUPER + " .. key, hl.dsp.window.move({ direction = dir }))
    end
end

-- Scrolling layout only

hl.bind("SUPER + UP", function()
    local active_ws = hl.get_active_workspace().id
    if active_ws >= 1 and active_ws <= 5 then
        hl.dispatch(hl.dsp.focus({ workspace = "r-1" }))
    end
    if active_ws >= 6 and active_ws <= 10 then
        hl.dispatch(hl.dsp.layout("focus up"))
    end
end, { repeating = true })

hl.bind("SUPER + DOWN", function()
    local active_ws = hl.get_active_workspace().id
    if active_ws >= 1 and active_ws < 5 then
        hl.dispatch(hl.dsp.focus({ workspace = "r+1" }))
    end
    if active_ws >= 6 and active_ws <= 10 then
        hl.dispatch(hl.dsp.layout("focus down"))
    end
end, { repeating = true })

hl.bind("SUPER + LEFT", function()
    local active_ws = hl.get_active_workspace().id
    if active_ws >= 1 and active_ws <= 5 then
        hl.dispatch(hl.dsp.layout("focus left"))
    end
    if active_ws >= 6 and active_ws <= 10 then
        hl.dispatch(hl.dsp.focus({ workspace = "r-1" }))
    end
end, { repeating = true })

hl.bind("SUPER + RIGHT", function()
    local active_ws = hl.get_active_workspace().id
    if active_ws >= 1 and active_ws <= 5 then
        hl.dispatch(hl.dsp.layout("focus right"))
    end
    if active_ws >= 6 and active_ws < 10 then
        hl.dispatch(hl.dsp.focus({ workspace = "r+1" }))
    end
end, { repeating = true })

hl.bind("SUPER + A", hl.dsp.layout("focus left"))
hl.bind("SUPER + D", hl.dsp.layout("focus right"))

hl.bind("SUPER + Prior", function()
    hl.dispatch(hl.dsp.focus({ monitor = "+1" }))
    hl.dispatch(hl.dsp.layout("focus up"))
    hl.dispatch(hl.dsp.focus({ monitor = "-1" }))
end)

hl.bind("SUPER + Next", function()
    hl.dispatch(hl.dsp.focus({ monitor = "+1" }))
    hl.dispatch(hl.dsp.layout("focus down"))
    hl.dispatch(hl.dsp.focus({ monitor = "-1" }))
end)

-- move windows
hl.bind("SHIFT + SUPER + UP", function()
    local active_ws = hl.get_active_workspace().id
    if active_ws >= 1 and active_ws <= 5 then
        hl.dispatch(hl.dsp.window.move({ workspace = "r-1" }))
    end
    if active_ws >= 6 and active_ws <= 10 then
        hl.dispatch(hl.dsp.window.swap({ direction = "up" }))
    end
end, { repeating = true })

hl.bind("SHIFT + SUPER + DOWN", function()
    local active_ws = hl.get_active_workspace().id
    if active_ws >= 1 and active_ws < 5 then
        hl.dispatch(hl.dsp.window.move({ workspace = "r+1" }))
    end
    if active_ws >= 6 and active_ws <= 10 then
        hl.dispatch(hl.dsp.window.swap({ direction = "down" }))
    end
end, { repeating = true })

hl.bind("SHIFT + SUPER + LEFT", function()
    local active_ws = hl.get_active_workspace().id
    if active_ws >= 1 and active_ws < 5 then
        hl.dispatch(hl.dsp.layout("swapcol l"))
    end
    if active_ws >= 6 and active_ws <= 10 then
        hl.dispatch(hl.dsp.window.move({ workspace = "r-1" }))
    end
end, { repeating = true })

hl.bind("SHIFT + SUPER + RIGHT", function()
    local active_ws = hl.get_active_workspace().id
    if active_ws >= 1 and active_ws <= 5 then
        hl.dispatch(hl.dsp.layout("swapcol r"))
    end
    if active_ws >= 6 and active_ws < 10 then
        hl.dispatch(hl.dsp.window.move({ workspace = "r+1" }))
    end
end, { repeating = true })

-- switch monitor focus
hl.bind("SUPER + ALT + LEFT", hl.dsp.focus({ monitor = "DP-1" }))
hl.bind("SHIFT + SUPER + ALT + LEFT", hl.dsp.window.move({ monitor = "DP-1" }))

hl.bind("SUPER + ALT + RIGHT", hl.dsp.focus({ monitor = "HDMI-A-1" }))
hl.bind("ALT + SHIFT + SUPER + RIGHT", hl.dsp.window.move({ monitor = "HDMI-A-1" }))

hl.bind("ALT + SUPER + S", hl.dsp.workspace.swap_monitors({ monitor1 = "DP-1", monitor2 = "HDMI-A-1"}))

-- resize windows (scrolling)
hl.bind("SUPER + R", hl.dsp.layout("colresize +conf"))
hl.bind("SHIFT + SUPER + R", hl.dsp.layout("colresize -conf"))

hl.bind("SUPER + mouse_up", hl.dsp.layout("move +col"))
hl.bind("SUPER + mouse_down", hl.dsp.layout("move -col"))

hl.bind("SUPER + SHIFT + mouse_up", hl.dsp.focus({ workspace = "r+1" }))
hl.bind("SUPER + SHIFT + mouse_down", hl.dsp.focus({ workspace = "r-1" }))

hl.bind("SUPER + W", hl.dsp.layout("consume"))
hl.bind("SUPER + S", hl.dsp.layout("expel"))

-- Multimedia Control

hl.bind("XF86AudioPlay",
    hl.dsp.exec_cmd(OSD_DIR .. "/playerctl.sh play-pause")
)

hl.bind("XF86AudioNext",
    hl.dsp.exec_cmd(OSD_DIR .. "/playerctl.sh next")
)

hl.bind("XF86AudioPrev",
    hl.dsp.exec_cmd(OSD_DIR .. "/playerctl.sh previous")
)

-- Volume Control (Sink)

hl.bind("XF86AudioRaiseVolume",
    hl.dsp.exec_cmd(OSD_DIR .. "/volume.sh sink up 0.05"),
    { locked = true, repeating = true }
)
hl.bind("XF86AudioLowerVolume",
    hl.dsp.exec_cmd(OSD_DIR .. "/volume.sh sink down 0.05"),
    { locked = true, repeating = true }
)
hl.bind("SHIFT + XF86AudioRaiseVolume",
    hl.dsp.exec_cmd(OSD_DIR .. "/volume.sh sink up 0.01"),
    { locked = true, repeating = true }
)
hl.bind("SHIFT + XF86AudioLowerVolume",
    hl.dsp.exec_cmd(OSD_DIR .. "/volume.sh sink down 0.01"),
    { locked = true, repeating = true }
)
hl.bind("XF86AudioMute",
    hl.dsp.exec_cmd(OSD_DIR .. "/volume.sh sink mute"),
    { locked = true }
)

-- Volume Control (Source)

hl.bind("CTRL + XF86AudioRaiseVolume",
    hl.dsp.exec_cmd(OSD_DIR .. "/volume.sh source up 0.05"),
    { locked = true, repeating = true }
)
hl.bind("CTRL + XF86AudioLowerVolume",
    hl.dsp.exec_cmd(OSD_DIR .. "/volume.sh source down 0.05"),
    { locked = true, repeating = true }
)
hl.bind("CTRL + SHIFT + XF86AudioRaiseVolume",
    hl.dsp.exec_cmd(OSD_DIR .. "/volume.sh source up 0.01"),
    { locked = true, repeating = true }
)
hl.bind("CTRL + SHIFT + XF86AudioLowerVolume",
    hl.dsp.exec_cmd(OSD_DIR .. "/volume.sh source down 0.01"),
    { locked = true, repeating = true }
)
hl.bind("CTRL + XF86AudioMute",
    hl.dsp.exec_cmd(OSD_DIR .. "/volume.sh source mute"),
    { locked = true }
)

-- Monitor Brightness Control (DDC/CI)
hl.bind("XF86MonBrightnessUp",
    hl.dsp.exec_cmd(OSD_DIR .. "/brightness.sh up")
)
hl.bind("XF86MonBrightnessDown",
    hl.dsp.exec_cmd(OSD_DIR .. "/brightness.sh down")
)

-- Applications

RUN_TERM = SCRIPT_DIR .. "/terminal.sh "

local app = {
    browser = "firefox",
    btop = "foot --app-id=btop btop",
    clipboard = RUN_TERM .. SCRIPT_DIR .. "/palette.sh clipboard",
    fileManager = "dolphin",
    menu = "fuzzel",
    screenshot = SCRIPT_DIR .. "/capture.sh region",
    terminal = "foot",
}

hl.bind("SUPER + Q", hl.dsp.window.close())
hl.bind("SHIFT + SUPER + Q", hl.dsp.window.kill())

hl.bind("SUPER + SPACE", hl.dsp.exec_cmd(app.menu))
hl.bind("SUPER + T", hl.dsp.exec_cmd(app.terminal))
hl.bind("SUPER + E", hl.dsp.exec_cmd(app.fileManager))
hl.bind("SUPER + B", hl.dsp.exec_cmd(app.browser))

hl.bind("SUPER + XF86AudioMute", hl.dsp.exec_cmd("pavucontrol"))

-- dmenu

DMENU = DMENU_DIR .. "/wrapper.sh "

hl.bind("CTRL + SUPER + SPACE", hl.dsp.exec_cmd(DMENU_DIR .. "/launcher.sh"))

hl.bind("SUPER + ESCAPE", hl.dsp.exec_cmd(DMENU_DIR .. "/quicksettings.sh"))
hl.bind("CTRL + SUPER + ESCAPE", hl.dsp.exec_cmd(DMENU_DIR .. "/settings.sh"))

hl.bind("SUPER + P", hl.dsp.exec_cmd(DMENU_DIR .. "/pacman.sh"))

hl.bind("ALT + SUPER + V", hl.dsp.exec_cmd(DMENU_DIR .. "/palette.sh"))
hl.bind("CTRL + SHIFT + SUPER + S", hl.dsp.exec_cmd(DMENU_DIR .. "/capture.sh"))

hl.bind("SHIFT + SUPER + S", hl.dsp.exec_cmd(app.screenshot))
hl.bind("SUPER + V", hl.dsp.exec_cmd(app.clipboard))

-- Power Options

hl.bind("CTRL + ALT + DELETE", hl.dsp.exec_cmd(DMENU_DIR .. "/power.sh"))
hl.bind("CTRL + ALT + L", hl.dsp.exec_cmd(SCRIPT_DIR .. "/power.sh toggle_inhibitor"))

-- Reload Waybar

hl.bind("SUPER + F5", hl.dsp.exec_cmd(SCRIPT_DIR .. "/reload.sh reload_waybar"))

-- monitor
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
