-------------------
---- AUTOSTART ----
-------------------

-- See https://wiki.hypr.land/Configuring/Basics/Autostart/

hl.on("hyprland.start", function()
    hl.exec_cmd("waybar")
    hl.exec_cmd("hypridle")
    hl.exec_cmd("systemctl --user start hyprpolkitagent")
    hl.exec_cmd("fcitx5 -r -d")
    hl.exec_cmd("awww-daemon")
    hl.exec_cmd("mako")

    -- Clipboard
    hl.exec_cmd("wl-paste --type text --watch cliphist store")  -- Stores only text data
    hl.exec_cmd("wl-paste --type image --watch cliphist store") -- Stores only image data
    hl.exec_cmd("wl-clip-persist --clipboard regular")

    -- Screen Sharing
    hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")

    -- Fix KDE6 StatusNotifierWatcher stopping Waybar
    -- See https://github.com/Alexays/Waybar/issues/3468

    hl.exec_cmd(
        "printf \"[D-BUS Service]\nName=org.kde.kded6\nExec=/bin/false\" > $HOME/.local/share/dbus-1/services/org.kde.kded6.service"
    )
end)

hl.on("hyprland.shutdown", function()
    hl.exec_cmd("rm $HOME/.local/share/dbus-1/services/org.kde.kded6.service")
end)

-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------

-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Environment-variables/

-- Nvidia
-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Environment-variables/#nvidia-specific

hl.env("GBM_BACKEND", "nvidia-drm")
hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")
hl.env("LIBVA_DRIVER_NAME", "nvidia")

-- Cursor
-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Environment-variables/#theming-related-variables

hl.env("HYPRCURSOR_THEME", "Bibata-Modern-Classic")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("XCURSOR_THEME", "Bibata-Modern-Classic")
hl.env("XCURSOR_SIZE", "24")

-- Qt
-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Environment-variables/#qt-variables

hl.env("QT_AUTO_SCREEN_SCALE_FACTOR", "1")
hl.env("QT_QPA_PLATFORM", "wayland;xcb")
hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")
hl.env("QT_WAYLAND_DISABLE_WINDOWDECORATION", "1")

-- KDE

hl.env("XDG_MENU_PREFIX", "arch-")

-- IDK

hl.env("EDITOR", "vim")

-- Fcitx

hl.env("GTK_IM_MODULE", "fcitx")
hl.env("QT_IM_MODULE", "fcitx")
hl.env("XMODIFIERS", "@im=fcitx")