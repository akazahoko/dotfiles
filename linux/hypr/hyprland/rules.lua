local color = require("themes.catppuccin_mocha")

----------------------
---- WINDOW RULES ----
----------------------

-- See https://wiki.hypr.land/Configuring/Basics/Window-Rules/

local opaque_windows = {
    ".*ark",
    ".*CoolerControl",
    ".*dolphin",
    ".*kate",
    ".*konsole",
    ".*kwrite",
    ".*Nautilus",
    ".*pavucontrol",
    ".*printer",
    ".*PrismLauncher",
    ".*Qalculate.*",
    ".*qBittorrent",
    ".*ThunderBird",
    ".*WhatsApp.*",
    "(?i).*manager.*",
    "(?i)code",
    "*.kdeconnect.*",
    "audacious",
    "btop",
    "calibre.*",
    "discord",
    "foot",
    "Kitty",
    "libreoffice.*",
    "nm-connection-editor",
    "obsidian",
    "protonvpn.*",
    "qdirstat",
    "qt.*ct",
    "waypaper",
    "webapp.*",
    "winegui",
}

local floating_windows = {
    ".*manager.*",
    ".*pavucontrol",
    ".*printer",
    "btop",
    "fastfetch",
    "firewall-config",
    "mpv",
    "nm-connection-editor",
    "nwg-look",
    "qt.*ct",
    "waypaper",
    "waypaper",
    "webapp.*",
}

for i, name in ipairs(opaque_windows) do hl.window_rule({ match = { class = name }, opacity = 0.9 }) end
for i, name in ipairs(floating_windows) do hl.window_rule({ match = { class = name }, float = true, size = { 1020, 765 } }) end

hl.window_rule({
    name = "pinned",
    match = { pin = true },
    border_size = 2,
    border_color = color.pinned_border_color,
})

hl.window_rule({
    name = "menu",
    match = { class = "menu" },
    pin = true,
    float = true,
    no_anim = true,
    size = {1020, 765},
    opacity = 0.9,
})

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

-------------------------
---- WORKSPACE RULES ----
-------------------------

-- See https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/
