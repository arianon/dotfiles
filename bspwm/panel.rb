#! /usr/bin/ruby

require "thread"
require "time"

COL =
{
    :black   => "%{F#FF1f1f22}",
    :red     => "%{F#FF8c5760}",
    :green   => "%{F#FF9db270}",
    :yellow  => "%{F#FFb28c55}",
    :blue    => "%{F#FF7086b2}",
    :magenta => "%{F#FF9c77b2}",
    :cyan    => "%{F#FF82a2b2}",
    :white   => "%{F#FFedeff2}",
}

ICO =
{
    :clock => "#{COL[:cyan]}  %{F-}",

    :alsa =>
    {
        :on  => "#{COL[:green]}  %{F-}",
        :off => "#{COL[:red]}  %{F-}",
    },

    :mpd =>
    {
        :on  => "#{COL[:blue]}  %{F-}",
        :off => "#{COL[:red]}  %{F-}",
    },

    :wifi =>
    [
        "#{COL[:red]}  %{F-}",
        "#{COL[:magenta]} %{F-}",
        "#{COL[:yellow]}  %{F-}",
        "#{COL[:blue]}  %{F-}",
        "#{COL[:cyan]}  %{F-}",
        "#{COL[:green]}  %{F-}",
    ],

    :xdesktops => ["□ ", "■ "],

    :bar => "", # "",
}

def mkbar(x)
    x = x / 10
    y = 10 - x

    active   = x > 0 ? (ICO[:bar] * x) : ""
    inactive = y > 0 ? COL[:black] + (ICO[:bar] * y) + "%{F-}" : ""

    return active << inactive
end

def _mkbar(arg)
    bar, max = "", 10
    cur = arg.to_i / max
    dif = max - cur

    if cur > 0
        bar << ICO[:bar] * cur
    end

    if dif > 0
        bar << COL[:black] + (ICO[:bar] * dif)
    end

    return bar << "%{F-}"
end


#################################################
#################################################

def xdesktops
    total = `xprop -root _NET_NUMBER_OF_DESKTOPS`
    current = IO.popen "xprop -root -spy _NET_CURRENT_DESKTOP"
    regex = /(?<=\=\s)[0-9](?=$)/

    begin
        status = ""

        xcur = current.gets.match(regex)[0].to_i
        xtot = total.match(regex)[0].to_i

        #for x in 0..xcur - 1
        status += ICO[:xdesktops][0] * (xcur)
        #end
        status += ICO[:xdesktops][1]
        #for x in xcur + 2..xtot
        status += ICO[:xdesktops][0] * (xtot - 1)
        #end

        puts status
    end while current.gets
end

def time
    loop {
        puts Time.new.strftime("c" << ICO[:clock] << "%r")
        sleep 1 #60 - Time.new.sec()
    }
end

def mpd
    sig = IO.popen "mpc idleloop player"

    begin
        mpc = `mpc`
        song = mpc.lines.first

        status = mpc.match(/playing/) ? ICO[:mpd][:on]  << song
               : mpc.match(/paused/)  ? ICO[:mpd][:off] << song
               : "NOTHING PLAYING"

        puts "m" << status
    end while sig.gets
end

def alsabar
    sig = IO.popen "mpc idleloop mixer"

    loop {
        #pcm = `amixer -M get PCM`
        master = `amixer -M get Master`

        volume = master.match(/[0-9]+(?=%)/)[0].to_i
        icon = master.match(/\[on\]/) ? ICO[:alsa][:on] : ICO[:alsa][:off]

        puts "m" << icon << mkbar(volume)
        break if sig.gets
    }
end


def wifi
    loop {
        iw = `iwconfig 2>/dev/null`
        info = iw.match(/ESSID:"(.*)".*Quality=([0-9]+)/m).captures

        essid = info[0]
        qual = (info[1].to_i * 100) / 70

        icon = ICO[:wifi][qual / 16]

        puts "w" << icon << essid
        sleep 20
    }
end


if __FILE__ == $0
    begin
        threads =
        [
            #Thread.new { time },
            #Thread.new { mpd },
            Thread.new { alsabar },
            #Thread.new { wifi },
            #Thread.new { xdesktops },
        ]

       threads.each { |thr| thr.join }
    rescue Interrupt
    end
end
