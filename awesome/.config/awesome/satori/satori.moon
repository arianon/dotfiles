icondir = require("awful.util").getdir"config" .. "/satori/icons/"

theme =
	font: "tewi 9"

	bg_normal: "#09090d"
	bg_focus: @bg_normal
	bg_urgent: @bg_normal
	bg_minimize: @bg_normal
	bg_systray: @bg_normal
	
	fg_normal: "#edeff2"
	fg_focus: "#7086b2"
	fg_urgent: "#8c5760"
	fg_minimize: @fg_normal
	
	border_width:  0
	border_normal: "#1f1f22"
	border_focus:  @border_normal -- fg_focus
	border_marked: "#7b3e7d"
	
	menu_height: 16
	menu_width: 100
	menu_bg_focus: @fg_normal
	menu_fg_focus: @bg_normal
	
	tasklist_fg_normal:	 "#8c8b8b"
	tasklist_bg_normal:	 @bg_normal
	tasklist_fg_focus: 	 @fg_normal
	tasklist_bg_focus: 	@bg_normal
	
	taglist_bg_focus: @bg_normal
	
	-- MENU
	menu_firefox: icondir .. "menu/firefox.png"
	menu_terminal: icondir .. "menu/terminal.png"
	menu_skype: icondir .. "menu/skype.png"
	menu_fileman: icondir .. "menu/fileman.png"
	menu_music: icondir .. "menu/music.png"
	menu_vim: icondir .. "menu/vim.png"
	menu_chat: icondir .. "menu/chat.png"
	menu_pinta: icondir .. "menu/pinta.png"
	menu_chromium: icondir .. "menu/chromium.png"
	menu_sublime: icondir .. "menu/sublime.png"
	menu_brackets: icondir .. "menu/brackets.png"


	menu_awesome: icondir .. "menu/awesome.png"
	menu_shutdown: icondir .. "menu/shutdown.png"
	menu_reboot: icondir .. "menu/reboot.png"
	menu_suspend: icondir .. "menu/suspend.png"
	
	-- WIDGETS
	widget_mpd: icondir .. "widgets/mpd.png"
	widget_paused: icondir .. "widgets/paused.png"
	widget_clock: icondir .. "widgets/clock.png"
	widget_volume: icondir .. "widgets/volume.png"
	widget_muted: icondir .. "widgets/muted.png"
	
	-- LAYOUTS
	layout_fairh: icondir .. "layouts/fairh.png"
	layout_fairv: icondir .. "layouts/fairv.png"
	layout_floating: icondir .. "layouts/floating.png"
	layout_magnifier: icondir .. "layouts/magnifier.png"
	layout_max: icondir .. "layouts/max.png"
	layout_fullscreen: icondir .. "layouts/fullscreen.png"
	layout_tilebottom: icondir .. "layouts/tilebottom.png"
	layout_tileleft: icondir .. "layouts/tileleft.png"
	layout_tile: icondir .. "layouts/tile.png"
	layout_tiletop: icondir .. "layouts/tiletop.png"
	layout_spiral: icondir .. "layouts/spiral.png"
	layout_dwindle: icondir .. "layouts/dwindle.png"

	menu_submenu_cion: icondir .. "submenu.png"
	separatorv: icondir .. "separatorv.png"
	separatorh: icondir .. "separatorh.png"
	widget_bg: "widget_bg.png"

	wallpaper: "~/usr/img/wallpaper"
	tasklist_disable_icon: true

theme