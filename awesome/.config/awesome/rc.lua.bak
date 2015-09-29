local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local vicious = require("vicious")
local gears = require("gears")
local naughty = require("naughty")
local menubar = require("menubar")
local bashets = require("bashets")
local string = { format = string.format }

-- I don't know why this is needed
awful.rules = require("awful.rules")
require("awful.autofocus")

-- Initialize beautiful
beautiful.init(awful.util.getdir("config") .. "/arianon/theme.lua")

-- Naughty options
naughty.config.defaults.font = "Terminus 10" or beautiful.font

---------------
-- VARIABLES --
---------------

local settings =  
{  
    modkey = "Mod1",
    terminal = "urxvt",
    browser = os.getenv("BROWSER") or "firefox",
    fileman = "thunar",
    music = "ncmpcpp",
    chat = "weechat",
    editor = os.getenv("EDITOR") or "vim",
    gui_editor = "subl3",
    dateformat = " %I:%M %p - %a, %d %b ",
    
    -- Table of layouts to cover with awful.layout.inc, order matters.
    layouts = 
    {
        awful.layout.suit.floating,
        awful.layout.suit.tile,
        awful.layout.suit.max,
    },
    
    -- Define a tag table which hold all screen tags.
    tags =
    {
        "■", "■", "■", "■", "■"
    }
}

----------------
--- FUNCTIONS --
----------------

settings.term_open = function (program)
    local program = program or ""
    return string.format("%s -e %s", settings.terminal, program)
end

settings.term_edit = function(x)
    local program = program or ""
    return string.format("%s -e %s %s", settings.terminal, settings.editor, program)
end

-- Check if awesome encountered an error during startup and fell back to another config (This code will only ever execute for the fallback config)
if awesome.startup_errors then
    naughty.notify({ preset = naughty.config.presets.critical,
                     title = "Oops, there were errors during startup!",
                     text = awesome.startup_errors })
end

-- Handle runtime errors after startup
do
    local in_error = false
    awesome.connect_signal("debug::error", function (err)
        -- Make sure we don't go into an endless error loop
        if in_error then return end
        in_error = true

        naughty.notify({ preset = naughty.config.presets.critical,
                         title = "Oops, an error happened!",
                         text = err })
        in_error = false
    end)
end

-- Wallpaper handling
if beautiful.wallpaper then
    for s = 1, screen.count() do
        gears.wallpaper.maximized(beautiful.wallpaper, s)
    end
end

-- Tags handling
local tags = {}
for s = 1, screen.count() do -- Each screen has its own tag table.
    tags[s] = awful.tag(settings.tags, s, settings.layouts[1])
end

----------
-- MENU --
----------

-- Create a laucher widget and a main menu
myawesomemenu = {
                { "manual",        settings.term_open("man awesome") },
                { "edit config",   settings.term_edit(awesome.conffile) },
                { "restart",       awesome.restart },
                { "quit",          awesome.quit }
}

mymainmenu = awful.menu({ 
    items = {
            { settings.browser,    settings.browser,                   beautiful.menu_firefox},
            { "chromium",          "chromium",                         beautiful.menu_chromium},
            { settings.terminal,   settings.terminal,                  beautiful.menu_terminal},
            { settings.fileman,    settings.fileman,                   beautiful.menu_fileman},
            { settings.music,      settings.term_open(settings.music), beautiful.menu_music},
            { "pinta",             "pinta",                            beautiful.menu_pinta},
            { settings.editor,     settings.term_edit(),               beautiful.menu_vim},
            { settings.gui_editor, settings.gui_editor,                beautiful.menu_sublime},
            { "skype",             "skype",                            beautiful.menu_skype},
            { "brackets",          "brackets",                         beautiful.menu_brackets},
            { settings.chat,       settings.term_open(settings.chat),  beautiful.menu_chat},
            { "awesome",           myawesomemenu,                      beautiful.menu_awesome},
            { "",                  "",                                 beautiful.  separatorh },
            { "reboot",            "systemctl reboot",                 beautiful.menu_reboot},
            { "suspend",           "systemctl suspend",                beautiful.menu_suspend},
            { "shutdown",          "systemctl poweroff",               beautiful.menu_shutdown},
            }
})

-- mylauncher = awful.widget.launcher({ image = beautiful.awesome_icon, menu = mymainmenu })

-------------
-- WIDGETS --
-------------

local separator = wibox.widget.imagebox(beautiful.separatorv)

-- TRAY
-- local traywidget = wibox.widget.systray()

-- CLOCK
local clockwidget = wibox.widget.textbox()
local clockicon = wibox.widget.imagebox(beautiful.widget_clock)
vicious.register(clockwidget, vicious.widgets.date, settings.dateformat, 30)

-- VOLUME
-- voltext = wibox.widget.textbox()
local volicon = wibox.widget.imagebox(beautiful.widget_volume)
local volbar = awful.widget.progressbar()
volbar:set_width(75)
volbar:set_value(100)
volbar:set_color(beautiful.fg_normal)
volbar:set_background_color(beautiful.bg_normal)

local volmargin = wibox.layout.margin(volbar, 8, 8)
volmargin:set_top(6)
volmargin:set_bottom(6)

local volwidget = wibox.widget.background(volmargin)
volwidget:set_bgimage(beautiful.widget_bg)

vicious.register(volbar, vicious.widgets.volume, "$1", 0.1, "PCM")
volwidget:buttons(awful.util.table.join(
    awful.button({}, 1, function() awful.util.spawn("amixer -Mq set Master toggle") end),
    awful.button({}, 4, function() awful.util.spawn("amixer -Mq set PCM 9%+") end),
    awful.button({}, 5, function() awful.util.spawn("amixer -Mq set PCM 9%-") end)
))

-- MPD
local mpdwidget = wibox.widget.textbox()
local mpdicon = wibox.widget.imagebox()

vicious.register(mpdwidget, vicious.widgets.mpd,
    function (widget, args)
        if args["{state}"] == "Pause" then
            mpdicon:set_image(beautiful.widget_paused)
        else
            mpdicon:set_image(beautiful.widget_mpd)
        end

        if args["{state}"] == "Stop" then
            mpdicon:set_image()
            return ""
        else
			 return string.format(" %s - %s ", args["{Artist}"], args["{Title}"])
        end
end, 0.1)

mpdwidget:buttons(awful.util.table.join (
    awful.button({}, 1, function() awful.util.spawn("mpc toggle") end),
    awful.button({}, 4, function() awful.util.spawn("mpc prev") end),
    awful.button({}, 5, function() awful.util.spawn("mpc next") end),
    awful.button({}, 3, function() awful.util.spawn(settings.term_open(settings.music)) end)
))

-- Shape up the wibox itself

local mywibox = {}
local mypromptbox = {}
local mylayoutbox = {}
local mytaglist = {}
mytaglist.buttons = awful.util.table.join(
                    awful.button({                 }, 1, awful.tag.viewonly),
                    awful.button({ settings.modkey }, 1, awful.client.movetotag),
                    awful.button({                 }, 3, awful.tag.viewtoggle),
                    awful.button({ settings.modkey }, 3, awful.client.toggletag),
                    awful.button({                 }, 4, function(t) awful.tag.viewprev(awful.tag.getscreen(t)) end),
                    awful.button({                 }, 5, function(t) awful.tag.viewnext(awful.tag.getscreen(t)) end)
                    )
mytasklist = {}
mytasklist.buttons = awful.util.table.join(
                     awful.button({ }, 1, function (c)
                                              if c == client.focus then
                                                  c.minimized = true
                                              else
                                                  -- Without this, the following
                                                  -- :isvisible() makes no sense
                                                  c.minimized = false
                                                  if not c:isvisible() then
                                                      awful.tag.viewonly(c:tags()[1])
                                                  end
                                                  -- This will also un-minimize
                                                  -- the client, if needed
                                                  client.focus = c
                                                  c:raise()
                                              end
                                          end),
                     awful.button({ }, 3, function ()
                                              if instance then
                                                  instance:hide()
                                                  instance = nil
                                              else
                                                  instance = awful.menu.clients({
                                                      theme = { width = 250 }
                                                  })
                                              end
                                          end),
                     awful.button({ }, 4, function ()
                                              awful.client.focus.byidx(1)
                                              if client.focus then client.focus:raise() end
                                          end),
                     awful.button({ }, 5, function ()
                                              awful.client.focus.byidx(-1)
                                              if client.focus then client.focus:raise() end
                                          end))

for s = 1, screen.count() do
    -- Create a promptbox for each screen
    mypromptbox[s] = awful.widget.prompt({ prompt = "<span color='#9db270'> » </span>" })

    -- Create an imagebox widget which will contains an icon indicating which layout we're using. We need one layoutbox per screen.
    mylayoutbox[s] = awful.widget.layoutbox(s)
    mylayoutbox[s]:buttons(awful.util.table.join(
                           awful.button({ }, 1, function () awful.layout.inc(settings.layouts, 1) end),
                           awful.button({ }, 3, function () awful.layout.inc(settings.layouts, -1) end),
                           awful.button({ }, 4, function () awful.layout.inc(settings.layouts, 1) end),
                           awful.button({ }, 5, function () awful.layout.inc(settings.layouts, -1) end)))
    
    mytaglist[s] = awful.widget.taglist(s, awful.widget.taglist.filter.all, mytaglist.buttons) -- Create a taglist widget
    mytasklist[s] = awful.widget.tasklist(s, awful.widget.tasklist.filter.currenttags, mytasklist.buttons) -- Create a tasklist widget
    mywibox[s] = awful.wibox({ position = "top", screen = s, height = 16 }) -- Create the wibox
    

    -- WIDGETS
    -- Widgets that are aligned to the left
    local left_layout = wibox.layout.fixed.horizontal()
    left_layout:add(mytaglist[s])
    left_layout:add(mylayoutbox[s])
    left_layout:add(mypromptbox[s])

    -- Widgets that are aligned to the center
    local mid_layout = wibox.layout.fixed.horizontal()
    mid_layout:add(mytaglist[s])

    -- Widgets that are aligned to the right
    local right_layout = wibox.layout.fixed.horizontal()
    right_layout:add(mpdicon)
    right_layout:add(mpdwidget)
    right_layout:add(volicon)
    right_layout:add(volwidget)
    right_layout:add(clockicon)
    right_layout:add(clockwidget)
	-- right_layout:add(separator)
	-- right_layout:add(traywidget)

    -- Now bring it all together (with the tasklist in the middle)
    local layout = wibox.layout.align.horizontal()
    layout:set_left(left_layout)
    -- layout:set_middle(mid_layout)
    layout:set_middle(mytasklist[s])
    layout:set_right(right_layout)

    mywibox[s]:set_widget(layout)
end

-- Mouse bindings
-- TODO: Do more mousewheel bindings. Because I fucking can, long live Awesome!
root.buttons(awful.util.table.join(
    awful.button({                         }, 3, function () mymainmenu:toggle() end),
    awful.button({                         }, 4, awful.tag.viewprev),
    awful.button({                         }, 5, awful.tag.viewnext)
))

local clientbuttons = awful.util.table.join(
    awful.button({ }, 1, function (c) client.focus = c; c:raise() end),
	-- awful.button({ }, 2, awful.mouse.client.move),
    awful.button({ settings.modkey }, 1, awful.mouse.client.move),
    awful.button({ settings.modkey }, 3, awful.mouse.client.resize)
)

-- Key bindings
local globalkeys = awful.util.table.join(
    awful.key({ settings.modkey,           }, "Left",   awful.tag.viewprev       ),
    awful.key({ settings.modkey,           }, "Right",  awful.tag.viewnext       ),
    awful.key({ settings.modkey,           }, "Escape", awful.tag.history.restore),

    -- awful.key({ settings.modkey,           }, "w", function () mymainmenu:show() end),
    
    -- Misc
    awful.key({                            }, "Print", function () awful.util.spawn("shoot -u") end),
    awful.key({ "Shift"                    }, "Print", release, function () awful.util.spawn("shoot -su") end),
	awful.key({ settings.modkey,           }, "o", function () awful.util.spawn("net_reload") end),
    awful.key({ settings.modkey,           }, "u", awful.client.urgent.jumpto),

    -- Layout manipulation

    awful.key({ settings.modkey,           }, "j",   function () awful.client.incwfact( 0.1)     end),
    awful.key({ settings.modkey,           }, "k",   function () awful.client.incwfact(-0.1)     end),
    awful.key({ settings.modkey,           }, "l",   function () awful.tag.incmwfact( 0.05)      end),
    awful.key({ settings.modkey,           }, "h",   function () awful.tag.incmwfact(-0.05)      end),
  
    awful.key({ settings.modkey, "Shift"   }, "j",   function () awful.client.swap.byidx(  1)    end),
    awful.key({ settings.modkey, "Shift"   }, "k",   function () awful.client.swap.byidx( -1)    end),
    awful.key({ settings.modkey, "Shift"   }, "h",   function () awful.tag.incnmaster( 1)        end),
    awful.key({ settings.modkey, "Shift"   }, "l",   function () awful.tag.incnmaster(-1)        end),    
      
    awful.key({ settings.modkey, "Control" }, "j",   function () awful.screen.focus_relative( 1) end),
    awful.key({ settings.modkey, "Control" }, "k",   function () awful.screen.focus_relative(-1) end),
    awful.key({ settings.modkey, "Control" }, "h",   function () awful.client.focus.byidx( 1) if client.focus then client.focus:raise() end end),
    awful.key({ settings.modkey, "Control" }, "l",   function () awful.client.focus.byidx(-1) if client.focus then client.focus:raise() end end),

    awful.key({ settings.modkey,           }, "Tab", function () awful.client.focus.history.previous() if client.focus then client.focus:raise() end end),
    awful.key({ settings.modkey,           }, "Return", function () awful.util.spawn(settings.terminal) end),
    awful.key({ settings.modkey,           }, "space", function () awful.layout.inc(settings.layouts,  1) end),
    awful.key({ settings.modkey, "Shift"   }, "space", function () awful.layout.inc(settings.layouts, -1) end),
    awful.key({ settings.modkey, "Control" }, "r", awesome.restart),
    awful.key({ settings.modkey, "Shift"   }, "q", awesome.quit),

    awful.key({ settings.modkey, "Control" }, "n", awful.client.restore),
    awful.key({ settings.modkey,           }, "r", function () mypromptbox[mouse.screen]:run() end), -- Prompt
    awful.key({ settings.modkey,           }, "p", function () menubar.show() end), -- Menubar
    awful.key({ settings.modkey,           }, "x", function () awful.prompt.run({ prompt = "Run Lua code: " }, mypromptbox[mouse.screen].widget, awful.util.eval, nil, awful.util.getdir("cache") .. "/history_eval") end)
)

local clientkeys = awful.util.table.join(
    awful.key({ settings.modkey,           }, "f",      function (c) c.fullscreen = not c.fullscreen  end),
    awful.key({ settings.modkey,           }, "w",      function (c) c:kill()                         end),
    awful.key({ settings.modkey,           }, "s",      awful.client.floating.toggle                     ),
    awful.key({ settings.modkey, "Control" }, "Return", function (c) c:swap(awful.client.getmaster()) end),
    awful.key({ settings.modkey,           }, "o",      awful.client.movetoscreen                        ),
    awful.key({ settings.modkey,           }, "t",      function (c) c.ontop = not c.ontop            end),
    awful.key({ settings.modkey,           }, "n",
        function (c)
            -- The client currently has the input focus, so it cannot be minimized, since minimized clients can't have the focus.
            c.minimized = true
        end),
    awful.key({ settings.modkey,           }, "m",
        function (c)
            c.maximized_horizontal = not c.maximized_horizontal
            c.maximized_vertical   = not c.maximized_vertical
        end)
)

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it works on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, 9 do
    globalkeys = awful.util.table.join(globalkeys,
        -- View tag only.
        awful.key({ settings.modkey }, "#" .. i + 9,
                  function ()
                        local screen = mouse.screen
                        local tag = awful.tag.gettags(screen)[i]
                        if tag then
                           awful.tag.viewonly(tag)
                        end
                  end),
        -- Toggle tag.
        awful.key({ settings.modkey, "Control" }, "#" .. i + 9,
                  function ()
                      local screen = mouse.screen
                      local tag = awful.tag.gettags(screen)[i]
                      if tag then
                         awful.tag.viewtoggle(tag)
                      end
                  end),
        -- Move client to tag.
        awful.key({ settings.modkey, "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus then
                          local tag = awful.tag.gettags(client.focus.screen)[i]
                          if tag then
                              awful.client.movetotag(tag)
                          end
                     end
                  end),
        -- Toggle tag.
        awful.key({ settings.modkey, "Control", "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus then
                          local tag = awful.tag.gettags(client.focus.screen)[i]
                          if tag then
                              awful.client.toggletag(tag)
                          end
                      end
                  end))
end

-- Set keys
root.keys(globalkeys)

-- Rules to apply to new clients (through the "manage" signal).
awful.rules.rules = {
    -- All clients will match this rule.
    { rule = { },
      properties = { border_width = beautiful.border_width,
                     border_color = beautiful.border_normal,
                     focus = awful.client.focus.filter,
                     raise = true,
                     size_hints_honor = true,
                     keys = clientkeys,
                     buttons = clientbuttons } },
    { rule = { class = "mplayer" },
      properties = { floating = true } },
    { rule = { class = "pinentry" },
      properties = { floating = true } },
    { rule = { class = "gimp" },
      properties = { floating = true } },
    -- Set Firefox to always map on tags number 2 of screen 1.
    -- { rule = { class = "Firefox" },
    --   properties = { tag = tags[1][2] } },
}

-- Signal function to execute when a new client appears.
client.connect_signal("manage", function (c, startup)
    -- Enable sloppy focus
    c:connect_signal("mouse::enter", function(c)
        if awful.layout.get(c.screen) ~= awful.layout.suit.magnifier
            and awful.client.focus.filter(c) then
            client.focus = c
        end
    end)

    if not startup then
        -- Set the windows at the slave,
        -- i.e. put it at the end of others instead of setting it master.
        -- awful.client.setslave(c)

        -- Put windows in a smart way, only if they does not set an initial position.
        if not c.size_hints.user_position and not c.size_hints.program_position then
            awful.placement.no_overlap(c)
            awful.placement.no_offscreen(c)
        end
    end

    local titlebars_enabled = false
    if titlebars_enabled and (c.type == "normal" or c.type == "dialog") then
        -- buttons for the titlebar
        local buttons = awful.util.table.join(
                awful.button({ }, 1, function()
                    client.focus = c
                    c:raise()
                    awful.mouse.client.move(c)
                end),
                awful.button({ }, 3, function()
                    client.focus = c
                    c:raise()
                    awful.mouse.client.resize(c)
                end)
                )

        -- Widgets that are aligned to the left
        local left_layout = wibox.layout.fixed.horizontal()
        -- left_layout:add(awful.titlebar.widget.iconwidget(c))
        left_layout:buttons(buttons)

        -- Widgets that are aligned to the right
        local right_layout = wibox.layout.fixed.horizontal()
        -- right_layout:add(awful.titlebar.widget.floatingbutton(c))
        -- right_layout:add(awful.titlebar.widget.stickybutton(c))
        -- right_layout:add(awful.titlebar.widget.ontopbutton(c))
        right_layout:add(awful.titlebar.widget.maximizedbutton(c))
        right_layout:add(awful.titlebar.widget.closebutton(c))

        -- The title goes in the middle
        local middle_layout = wibox.layout.flex.horizontal()
        local title = awful.titlebar.widget.titlewidget(c)
        title:set_align("center")
        middle_layout:add(title)
        middle_layout:buttons(buttons)

        -- Now bring it all together
        local layout = wibox.layout.align.horizontal()
        layout:set_left(left_layout)
        layout:set_right(right_layout)
        layout:set_middle(middle_layout)

        awful.titlebar(c):set_widget(layout)
    end
end)

client.connect_signal("focus", function(c) c.border_color = beautiful.border_focus end)
client.connect_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)

-- Remove the annoying stopwatch icon when loading applications
local oldspawn = awful.util.spawn
awful.util.spawn = function (s)
  oldspawn(s, false)
  end
