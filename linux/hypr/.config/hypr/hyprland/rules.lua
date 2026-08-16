local color = require("hyprland.theme")

----------------------
---- WINDOW RULES ----
----------------------

-- See https://wiki.hypr.land/Configuring/Basics/Window-Rules/

OPACITY = 0.9

local opaque_windows = {
    ".*ark",
    ".*CoolerControl",
    ".*dolphin",
    ".*kate",
    ".*konsole",
    ".*kwrite",
    ".*Nautilus",
    ".*PrismLauncher",
    ".*Qalculate.*",
    ".*qBittorrent",
    ".*ThunderBird",
    "(?i).*manager.*",
    "(?i)code",
    "*.kdeconnect.*",
    "audacious",
    "calibre.*",
    "discord",
    "foot",
    "Kitty",
    "libreoffice.*",
    "obsidian",
    "protonvpn.*",
    "qdirstat",
    "qt.*ct",
    "webapp.*",
    "winegui",
}

for i, name in ipairs(opaque_windows) do hl.window_rule({ match = { class = name }, opacity = OPACITY }) end

-- Pinned Windows

hl.window_rule({
    name = "pinned",
    match = { pin = true },
    border_size = 2,
    border_color = color.pinned_border_color,
})

-- Special Windows

local special_windows = {
    ".*pavucontrol",
    ".*printer",
    "blueman-manager",
    "btop",
    "menu",
    "nm-connection-editor",
}

for _, name in ipairs(special_windows) do
    hl.window_rule({
        match = { class = name },
        workspace = "special",
        opacity = OPACITY
    })
end

-- Fixed Size

hl.window_rule({ match = { class = "python3", title = "Choose Video Folder" }, size = { 1020, 765 } })
hl.window_rule({ match = { class = "kvantummanager", title = "Open Kvantum Theme Folder..." }, size = { 1020, 765 } })

---------------------
---- LAYER RULES ----
---------------------

-- See https://wiki.hypr.land/Configuring/Basics/Window-Rules/#layer-rules

hl.layer_rule({
    name = "fuzzel",
    match = { namespace = "fuzzel" },
    blur = true,
    dim_around = true,
    no_anim = true
})

hl.layer_rule({
    name = "rofi",
    match = { namespace = "rofi" },
    blur = true,
    dim_around = false,
    no_anim = true
})

-------------------------
---- WORKSPACE RULES ----
-------------------------

-- See https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/

hl.workspace_rule({
    workspace = "special:special",
    gaps_out = 150,
    gaps_in = 20,
})
