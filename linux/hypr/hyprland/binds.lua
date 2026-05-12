---------------
---- BINDS ----
---------------

-- See https://wiki.hypr.land/Configuring/Basics/Binds/
-- See https://wiki.hypr.land/Configuring/Basics/Dispatchers/

-- Variables

SCRIPT = "~/.dotfiles/linux/scripts"

local layout = hl.get_active_workspace().tiled_layout

local directions = {
    -- Arrow Keys
    { "UP",    "up" },
    { "DOWN",  "down" },
    { "LEFT",  "left" },
    { "RIGHT", "right" },

    -- VIM Keys
    { "k",     "up" },
    { "j",     "down" },
    { "h",     "left" },
    { "l",     "right" },
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

-- Scrolling

if layout == "scrolling" then
    hl.bind("SUPER + UP", hl.dsp.focus({ workspace = "r-1" }))
    hl.bind("SUPER + DOWN", hl.dsp.focus({ workspace = "r+1" }))
    hl.bind("SUPER + LEFT", hl.dsp.layout("focus left"))
    hl.bind("SUPER + RIGHT", hl.dsp.layout("focus right"))

    hl.bind("SHIFT + SUPER + UP", function() move_to_workspace("r-1") end)
    hl.bind("SHIFT + SUPER + DOWN", function() move_to_workspace("r+1") end)
    hl.bind("SHIFT + SUPER + LEFT", hl.dsp.layout("swapcol l"))
    hl.bind("SHIFT + SUPER + RIGHT", hl.dsp.layout("swapcol r"))

    hl.bind("SUPER + COMMA", hl.dsp.layout("focus left"))
    hl.bind("SUPER + PERIOD", hl.dsp.layout("focus right"))

    hl.bind("SHIFT + SUPER + COMMA", hl.dsp.layout("swapcol l"))
    hl.bind("SHIFT + SUPER + PERIOD", hl.dsp.layout("swapcol r"))

    hl.bind("SUPER + R", hl.dsp.layout("colresize +conf"))

    hl.bind("SUPER + mouse_up", hl.dsp.layout("move +col"))
    hl.bind("SUPER + mouse_down", hl.dsp.layout("move -col"))

    hl.bind("SUPER + SHIFT + mouse_up", hl.dsp.focus({ workspace = "r+1" }))
    hl.bind("SUPER + SHIFT + mouse_down", hl.dsp.focus({ workspace = "r-1" }))
end

-- Multimedia Control

-- Volume Control (Sink)

hl.bind("XF86AudioRaiseVolume",
    hl.dsp.exec_cmd(SCRIPT .. "/osd/volume.sh sink up 0.05"),
    { locked = true, repeating = true }
)
hl.bind("XF86AudioLowerVolume",
    hl.dsp.exec_cmd(SCRIPT .. "/osd/volume.sh sink down 0.05"),
    { locked = true, repeating = true }
)
hl.bind("SHIFT + XF86AudioRaiseVolume",
    hl.dsp.exec_cmd(SCRIPT .. "/osd/volume.sh sink up 0.01"),
    { locked = true, repeating = true }
)
hl.bind("SHIFT + XF86AudioLowerVolume",
    hl.dsp.exec_cmd(SCRIPT .. "/osd/volume.sh sink down 0.01"),
    { locked = true, repeating = true }
)
hl.bind("XF86AudioMute",
    hl.dsp.exec_cmd(SCRIPT .. "/osd/volume.sh sink mute"),
    { locked = true }
)

-- Volume Control (Source)

hl.bind("CTRL + XF86AudioRaiseVolume",
    hl.dsp.exec_cmd(SCRIPT .. "/osd/volume.sh source up 0.05"),
    { locked = true, repeating = true }
)
hl.bind("CTRL + XF86AudioLowerVolume",
    hl.dsp.exec_cmd(SCRIPT .. "/osd/volume.sh source down 0.05"),
    { locked = true, repeating = true }
)
hl.bind("CTRL + SHIFT + XF86AudioRaiseVolume",
    hl.dsp.exec_cmd(SCRIPT .. "/osd/volume.sh source up 0.01"),
    { locked = true, repeating = true }
)
hl.bind("CTRL + SHIFT + XF86AudioLowerVolume",
    hl.dsp.exec_cmd(SCRIPT .. "/osd/volume.sh source down 0.01"),
    { locked = true, repeating = true }
)
hl.bind("CTRL + XF86AudioMute",
    hl.dsp.exec_cmd(SCRIPT .. "/osd/volume.sh source mute"),
    { locked = true }
)

-- Monitor Brightness Control (DDC/CI)
hl.bind("XF86MonBrightnessUp",
    hl.dsp.exec_cmd(SCRIPT .. "/osd/brightness.sh up")
)
hl.bind("XF86MonBrightnessDown",
    hl.dsp.exec_cmd(SCRIPT .. "/osd/brightness.sh down")
)

-- Applications

local app = {
    menu = "fuzzel",
    terminal = "foot",
    fileManager = "dolphin",
    btop = "foot --app-id=btop btop",
    screenshot = "hyprshot -m region -o $(xdg-user-dir PICTURES)/Screenshots",
}

hl.bind("SUPER + Q", hl.dsp.window.close())
hl.bind("SHIFT + SUPER + Q", hl.dsp.window.kill())

hl.bind("SUPER + SPACE", hl.dsp.exec_cmd(app.menu))
hl.bind("SUPER + T", hl.dsp.exec_cmd(app.terminal))
hl.bind("SUPER + E", hl.dsp.exec_cmd(app.fileManager))
hl.bind("SHIFT + SUPER + S", hl.dsp.exec_cmd(app.screenshot))
hl.bind("SUPER + ESCAPE", hl.dsp.exec_cmd(app.btop))

-- dmenu

hl.bind("SUPER + P", hl.dsp.exec_cmd(SCRIPT .. "/dmenu/launcher.sh pacman"))
hl.bind("SUPER + V", hl.dsp.exec_cmd(SCRIPT .. "/dmenu/launcher.sh clipboard clipboard"))
hl.bind("SHIFT + SUPER + V", hl.dsp.exec_cmd(SCRIPT .. "/dmenu/launcher.sh clipboard"))

-- Power Options

hl.bind("CTRL + ALT + DELETE", hl.dsp.exec_cmd(SCRIPT .. "/dmenu/launcher.sh power"))
hl.bind("CTRL + ALT + L", hl.dsp.exec_cmd(SCRIPT .. "/inhibitor.sh"))

-- Reload Waybar

hl.bind("SUPER + F5", hl.dsp.exec_cmd(SCRIPT .. "/reload.sh waybar"))