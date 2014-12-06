local awful = { util = require("awful.util") }
local icondir = awful.util.getdir("config") .. "/arianon/icons/"

local theme = {}

-- BASICS
theme.font          = "Terminus 8"

theme.bg_normal     = "#09090d"
theme.bg_focus      = theme.bg_normal
theme.bg_urgent     = theme.bg_normal
theme.bg_minimize   = theme.bg_normal
theme.bg_systray    = theme.bg_normal

theme.fg_normal     = "#edeff2"
theme.fg_focus      = "#7086b2"
theme.fg_urgent     = "#8c5760"
theme.fg_minimize   = theme.fg_normal

theme.border_width  = 0
theme.border_normal = "#1f1f22"
theme.border_focus  = theme.border_normal -- theme.fg_focus
theme.border_marked = "#7b3e7d"

theme.menu_height   = 16
theme.menu_width    = 100
theme.menu_bg_focus = theme.fg_normal
theme.menu_fg_focus = theme.bg_normal

theme.tasklist_fg_normal = "#8c8b8b"
theme.tasklist_bg_normal = theme.bg_normal
theme.tasklist_fg_focus  = theme.fg_normal
theme.tasklist_bg_focus = theme.bg_normal

theme.taglist_bg_focus = theme.bg_normal

-- MENU
theme.menu_firefox          = icondir .. "menu/firefox.png"
theme.menu_terminal         = icondir .. "menu/terminal.png"
theme.menu_skype            = icondir .. "menu/skype.png"
theme.menu_fileman          = icondir .. "menu/fileman.png"
theme.menu_music            = icondir .. "menu/music.png"
theme.menu_vim              = icondir .. "menu/vim.png"
theme.menu_chat             = icondir .. "menu/chat.png"
theme.menu_pinta            = icondir .. "menu/pinta.png"
theme.menu_chromium         = icondir .. "menu/chromium.png"
theme.menu_sublime          = icondir .. "menu/sublime.png"
theme.menu_brackets         = icondir .. "menu/brackets.png"


theme.menu_awesome          = icondir .. "menu/awesome.png"
theme.menu_shutdown         = icondir .. "menu/shutdown.png"
theme.menu_reboot           = icondir .. "menu/reboot.png"
theme.menu_suspend          = icondir .. "menu/suspend.png"

-- WIDGETS
theme.widget_mpd            = icondir .. "widgets/mpd.png"
theme.widget_paused         = icondir .. "widgets/paused.png"
theme.widget_clock          = icondir .. "widgets/clock.png"
theme.widget_volume         = icondir .. "widgets/volume.png"
theme.widget_muted          = icondir .. "widgets/muted.png"

-- LAYOUTS
theme.layout_fairh          = icondir .. "layouts/fairh.png"
theme.layout_fairv          = icondir .. "layouts/fairv.png"
theme.layout_floating       = icondir .. "layouts/floating.png"
theme.layout_magnifier      = icondir .. "layouts/magnifier.png"
theme.layout_max            = icondir .. "layouts/max.png"
theme.layout_fullscreen     = icondir .. "layouts/fullscreen.png"
theme.layout_tilebottom     = icondir .. "layouts/tilebottom.png"
theme.layout_tileleft       = icondir .. "layouts/tileleft.png"
theme.layout_tile           = icondir .. "layouts/tile.png"
theme.layout_tiletop        = icondir .. "layouts/tiletop.png"
theme.layout_spiral         = icondir .. "layouts/spiral.png"
theme.layout_dwindle        = icondir .. "layouts/dwindle.png"

-- TITLEBARS

theme.titlebar_close_button_normal = icondir .. "titlebar/close_normal.png"
theme.titlebar_close_button_focus  = icondir .. "titlebar/close_focus.png"

theme.titlebar_ontop_button_normal_inactive = icondir .. "titlebar/ontop_normal_inactive.png"
theme.titlebar_ontop_button_focus_inactive  = icondir .. "titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_active = icondir .. "titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_active  = icondir .. "titlebar/ontop_focus_active.png"

theme.titlebar_sticky_button_normal_inactive = icondir .. "titlebar/sticky_normal_inactive.png"
theme.titlebar_sticky_button_focus_inactive  = icondir .. "titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_active = icondir .. "titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_active  = icondir .. "titlebar/sticky_focus_active.png"

theme.titlebar_floating_button_normal_inactive = icondir .. "titlebar/floating_normal_inactive.png"
theme.titlebar_floating_button_focus_inactive  = icondir .. "titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_active = icondir .. "titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_active  = icondir .. "titlebar/floating_focus_active.png"

theme.titlebar_maximized_button_normal_inactive = icondir .. "titlebar/maximized_normal_inactive.png"
theme.titlebar_maximized_button_focus_inactive  = icondir .. "titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_active = icondir .. "titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_active  = icondir .. "titlebar/maximized_focus_active.png"

-- OTHER

-- theme.taglist_squares_sel   = icondir .. "taglist/sel.png" 
-- theme.taglist_squares_unsel = icondir .. "taglist/unsel.png"
theme.menu_submenu_icon     = icondir .. "submenu.png"
theme.separatorv            = icondir .. "separatorv.png"
theme.separatorh            = icondir .. "separatorh.png"
theme.widget_bg				= icondir .. "widget_bg.png"

-- MISC
theme.wallpaper             = "~/Pictures/Wallpapers/clouds.jpg"
theme.tasklist_disable_icon = true
theme.useless_gap			= 25

return theme
-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
