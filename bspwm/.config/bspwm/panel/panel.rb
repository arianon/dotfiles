#!/usr/bin/env ruby
# coding: utf-8

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
  :clock => "#{COL[:cyan]} ⭧ %{F-}",

  :alsa =>
  {
    :on  => "#{COL[:green]}  %{F-}",
    :off => "#{COL[:red]}  %{F-}",
  },

  :mpd =>
  {
    :on  => "#{COL[:blue]} ⭯ %{F-}",
    :off => "#{COL[:red]}  %{F-}",
  },

  :xdesktops => ["□ ", "■ "],

  :bar => "☷", # ⣿
}

def mkbar(x)
  x = x / 10
  y = 10 - x

  active   = x > 0 ? (ICO[:bar] * x) : ""
  inactive = y > 0 ? COL[:black] + (ICO[:bar] * y) + "%{F-}" : ""

  return active << inactive
end

def time
  loop {
    puts Time.new.strftime("c" << ICO[:clock] << "%I:%M %p")
    sleep 60 - Time.new.sec()
  }
end

def mpd
  loop {
    mpc = `mpc`
    song = mpc.lines.first

    status = mpc.match(/playing/) ? ICO[:mpd][:on]  << song
    : mpc.match(/paused/)  ? ICO[:mpd][:off] << song
    : "NOTHING PLAYING"

    puts "m" << status
    system "mpc idle player >/dev/null"
  }
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

if __FILE__ == $0
  alsabar
#  threads =
#     [
#       Thread.new { time },
#       Thread.new { mpd },
#       Thread.new { alsabar },
#       #Thread.new { wifi },
#       #Thread.new { xdesktops },
#   ]
# 
#     threads.each { |thr| thr.join }
end
