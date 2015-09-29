gears = require "gears"
awful = require "awful"
wibox = require "wibox"
beautiful = require "beautiful"
naughty = require "naughty"
menubar = require "menubar"

awful.rules = require "awful.rules"
require "awful.autofocus"

map = require "map"

--| Startup errors
if awesome.startup_errors
	naughty.notify
		preset: naughty.config.presets.critical
		title: "Oops, there were errors during startup!"
		text: awesome.startup_errors


--| Runtime errors
do
	in_error = false
	awesome.connect_signal "debug::error", (err) ->
		return if in_error
		in_error = true

		naughty.notify
			preset: naughty.config.presets.critical
			title: "Oops, an error happened!"
			text: err

		in_error = false


--| Beautiful
-- beautiful.init awful.util.getdir"config" .. "/satori/satori.moon"
beautiful.init "/usr/share/awesome/themes/zenburn/theme.lua"


--| Variables
modkey = "Mod4"
terminal = "termite -e fish"
editor = "emacsclient -c --no-wait"

layouts = {
        awful.layout.suit.floating
        awful.layout.suit.tile
        awful.layout.suit.max
}

mytags = {"I", "II", "III", "IV", "V"}


--| Wallpaper
if beautiful.wallpaper
	for s = 1, screen.count!
		gears.wallpaper.maximized beautiful.wallpaper, s, true


--| Menu
mainmenu = awful.menu
    items: {
        { "termite", terminal}
        { "chromium", "chromium"}
        { "restart", awesome.restart }
        { "quit", awesome.quit }
    }


--| Tags
tags = for _ = 1, screen.count!
	awful.tag mytags, s, layouts[0]

tagbuttons = map.buttons
    [mods: {      }, m: 1]: awful.tag.viewonly
    [mods: {modkey}, m: 1]: awful.client.movetotag
    [mods: {      }, m: 3]: awful.tag.viewtoggle
    [mods: {modkey}, m: 3]: awful.client.toggletag
    [mods: {      }, m: 4]: (t) -> awful.tag.viewnext awful.tag.getscreen t
    [mods: {      }, m: 5]: (t) -> awful.tag.viewprev awful.tag.getscreen t


--| Task list
taskbuttons = map.buttons
    [mods: {      }, m: 1]: (c) ->
        c.minimized = c == client.focus
        unless c.minimized
            unless c\isvisible!
                awful.tag.viewonly c.tags![1]
            client.focus = c
            c\raise!

    [mods: {      }, m: 3]: ->
        if instance
            instance\hide!
            instance = nil
        else
            instance = awful.menu.clients theme: width: 250

    [mods: {      }, m: 4]: ->
        awful.client.focus.byidx 1
        client.focus\raise! if client.focus

    [mods: {      }, m: 5]: ->
        awful.client.focus.byidx -1
        client.focus\raise! if client.focus


--| Wibox
promptbox = {}

for s = 1, screen.count!
    promptbox[s] = awful.widget.prompt prompt: "» "

    -- Create the wibox
    with awful.wibox position: "top", screen: s
        \set_widget with wibox.layout.align.horizontal!
            \set_left with wibox.layout.fixed.horizontal!
                -- Taglist
                \add awful.widget.taglist s,
                    awful.widget.taglist.filter.all,
                    tagbuttons
                \add promptbox[s]

            -- Task list
            \set_middle awful.widget.tasklist s,
                awful.widget.tasklist.filter.currenttags,
                taskbuttons

            \set_right with wibox.layout.fixed.horizontal!
                \add awful.widget.textclock!

                -- Layout box
                \add with awful.widget.layoutbox s
                    \buttons map.buttons
                        [mods: {}, m: 1]: -> awful.layout.inc layouts,  1
                        [mods: {}, m: 3]: -> awful.widget.inc layouts, -1
                        [mods: {}, m: 4]: -> awful.layout.inc layouts,  1
                        [mods: {}, m: 5]: -> awful.layout.inc layouts, -1


--| Mouse bindings
root.buttons map.buttons
    [mods: {}, m: 3]: mainmenu\toggle
    [mods: {}, m: 4]: awful.tag.viewnext
    [mods: {}, m: 5]: awful.tag.viewprev


-- | Keybindings
globalkeys = map.keys
    [mods: {modkey, "Shift"  }, k: "e"]: -> awful.util.spawn editor

    [mods: {modkey           }, k: "Left"  ]: awful.tag.viewprev
    [mods: {modkey           }, k: "Right" ]: awful.tag.viewnext
    [mods: {modkey           }, k: "Escape"]: awful.tag.history.restore

    [mods: {modkey           }, k: "j"     ]: ->
        awful.client.focus.byidx 1
        client.focus\raise! if client.focus

    [mods: {modkey           }, k: "k"     ]: ->
        awful.client.focus.byidx -1
        client.focus\raise! if client.focus

    [mods: {modkey           }, k: "w"     ]: mainmenu\show
    [mods: {modkey, "Shift"  }, k: "j"     ]: -> awful.client.swap.byidx  1
    [mods: {modkey, "Shift"  }, k: "k"     ]: -> awful.client.swap.byidx -1
    [mods: {modkey, "Control"}, k: "j"     ]: -> awful.screen.focus_relative  1
    [mods: {modkey, "Control"}, k: "k"     ]: -> awful.screen.focus_relative -1
    [mods: {modkey           }, k: "u"     ]: awful.client.urgent.jumpto
    [mods: {modkey           }, k: "Tab"   ]: ->
        awful.client.focus.history.previous!
        client.focus\raise! if client.focus

    [mods: {modkey           }, k: "Return"]: -> awful.util.spawn terminal
    [mods: {modkey, "Control"}, k: "r"     ]: awesome.restart
    [mods: {modkey, "Shift"  }, k: "q"     ]: awesome.quit

    [mods: {modkey           }, k: "l"     ]: -> awful.tag.incmwfact  0.05
    [mods: {modkey           }, k: "h"     ]: -> awful.tag.incmwfact -0.05
    [mods: {modkey, "Shift"  }, k: "h"     ]: -> awful.tag.incnmaster  1
    [mods: {modkey, "Shift"  }, k: "l"     ]: -> awful.tag.incnmaster -1
    [mods: {modkey, "Control"}, k: "h"     ]: -> awful.tag.incncol  1
    [mods: {modkey, "Control"}, k: "l"     ]: -> awful.tag.incncol -1
    [mods: {modkey           }, k: "space" ]: -> awful.layout.inc layouts, 1
    [mods: {modkey, "Shift"  }, k: "space" ]: -> awful.layout.inc layouts, -1

    [mods: {modkey, "Control"}, k: "n"     ]: awful.client.restore

    [mods: {modkey           }, k: "r"     ]: ->
        promptbox[mouse.screen]\run!

    [mods: {modkey           }, k: "p"     ]: -> menubar.show!

-- Tag keys.
for i = 1, 9
    globalkeys = awful.util.table.join globalkeys, map.keys

        --  View tag only.
        [mods: {modkey                    }, k: "#" .. i + 9]: ->
            tag = (awful.tag.gettags mouse.screen)[i]
            awful.tag.viewonly tag if tag

        --  Toggle tag.
        [mods: {modkey, "Control"         }, k: "#" .. i + 9]: ->
            tag = (awful.tag.gettags mouse.screen)[i]
            awful.tag.viewtoggle tag if tag

        --  Move client to tag.
        [mods: {modkey, "Shift"           }, k: "#" .. i + 9]: ->
            if client.focus
                tag = (awful.tag.gettags client.focus.screen)[i]
                awful.client.movetotag tag if tag

        --  Toggle tag.
        [mods: {modkey, "Control", "Shift"}, k: "#" .. i + 9]: ->
            if client.focus
                tag = (awful.tag.gettags client.focus.screen)[i]
                awful.client.toggletag tag if tag

root.keys globalkeys

clientkeys = map.keys
    [mods: {modkey, "Shift"   }, k: "c"     ]: (c) -> c\kill!
    [mods: {modkey, "Control" }, k: "space" ]: awful.client.floating.toggle
    [mods: {modkey,           }, k: "o"     ]: awful.client.movetoscreen
    [mods: {modkey,           }, k: "n"     ]: (c) -> c.minimized = not c.minimized
    [mods: {modkey,           }, k: "t"     ]: (c) -> c.ontop = not c.ontop

    [mods: {modkey, "Control" }, k: "Return"]: (c) ->
        c\swap awful.client.getmaster!

    [mods: {modkey,           }, k: "m"     ]: (c) ->
        c.maximized = not c.maximized
        c\raise!

    [mods: {modkey,           }, k: "f"     ]: (c) ->
        c.fullscreen = not c.fullscreen
        c\raise!

clientbuttons = map.buttons
    [mods: {      }, m: 1]: (c) ->
        client.focus = c
        c\raise!
    [mods: {modkey}, m: 1]: awful.mouse.client.move
    [mods: {modkey}, m: 3]: awful.mouse.client.resize


--| Rules
awful.rules.rules = {
    { rule: {} -- All clients will match this rule.
        properties:
            border_width: beautiful.border_width
            border_color: beautiful.border_normal
            focus: awful.client.focus.filter
            raise: true
            keys: clientkeys
            buttons: clientbuttons }
    { rule: {class: "MPlayer"}, properties: {floating: true} }
    { rule: {class: "pinentry"}, properties: {floating: true} }
    { rule: {class: "gimp"}, properties: {floating: true} }
--  { rule: {class: "Firefox"},  properties: {tag: tags[1][2]} }
}


--| Signals
client.connect_signal "manage", (c, startup) ->
    with c.size_hints
        unless startup
            if not .user_position and not .program_position
                awful.placement.no_overlap c
                awful.placement.no_offscreen c


client.connect_signal "mouse::enter", (c) ->
    focusable = (awful.layout.get c.screen) ~= awful.layout.suit.magnifier
    focusable and= awful.client.focus.filter c
    client.focus = c if focusable


client.connect_signal "focus", (c) ->
    c.border_color = beautiful.border_focus


client.connect_signal "unfocus", (c) ->
    c.border_color = beautiful.border_normal
