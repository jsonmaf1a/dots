if (uwsm check may-start | complete).exit_code == 0 {
    exec uwsm start hyprland.desktop
}

$env.XDG_SESSION_DESKTOP = "wayland"
$env.QT_QPA_PLATFORM = "wayland"
$env.XDG_SESSION_TYPE = "wayland"
$env.GDK_BACKEND = "wayland"
$env.ELECTRON_OZONE_PLATFORM_HINT = "wayland;xcb"
$env.OZONE_PLATFORM = "wayland"
$env.XDG_CURRENT_DESKTOP = "Hyprland"
$env.XDG_SESSION_DESKTOP = "Hyprland"
$env.QT_AUTO_SCREEN_SCALE_FACTOR = "1"
$env.QT_WAYLAND_DISABLE_WINDOWDECORATION = "1"
$env.WLR_DRM_NO_ATOMIC = "1"
$env.QT_QPA_PLATFORMTHEME = "qt6ct"
$env.QT_STYLE_OVERRIDE = "Breeze"
$env.XCURSOR_SIZE = "24"
