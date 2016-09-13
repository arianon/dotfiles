# coding: utf-8
require 'json'
require 'open-uri'

Thread.abort_on_exception = true

at_exit { close! }

require_relative 'helpers'
require_relative 'mkbar'

$state = Hash.new('...')
$listeners = []

def render!
  puts format('%%{l}%{music}%%{c}%{desktops}%%{r}%{bitcoin} %{memory} %{volume} %{calendar} %{clock} ', $state)
  STDOUT.flush
end

def update!(hsh)
  $state.merge!(hsh) && render!
end

def close!
  $listeners.each(&:close)
end

def clock
  icon = ' TIME '.background!(:red)
  time = Time.new.strftime('%I:%M %p')
  "#{icon} #{time}"
end

def calendar
  icon = ' DATE '.background!(:magenta)
  date = Time.new.strftime('%a %d %b')

  "#{icon} #{date}"
end

def memory
  total, free, buffers, cached = File.read('/proc/meminfo')
                                     .scan(/^(?:MemTotal|MemFree|Buffers|Cached):\s+(\d+) kB/)
				     .flatten
				     .map!(&:to_f)
				     .map! { |n| n / 1024 }

  real_free = free + buffers + cached
  used = total - real_free
  percentage = (used / total) * 100

  icon = ' MEM '.background!(:blue)

  "#{icon} #{mkbar(percentage)}"
end

def bitcoin
  rates = open('http://api.bitven.com/prices') { |f| JSON.parse(f.read) }

  prices = {
    USD: rates['BTC_TO_USD_RATE'] * 0.001,
    VEF: rates['BTC_TO_USD_RATE'] * rates['USD_TO_BSF_RATE'] * 0.001
  }

  icon = ' m฿ '.background!(:yellow)
  usd = format('%.2f', prices[:USD]).foreground!(:green)
  vef = format('%d', prices[:VEF]).foreground!(:red)

  "#{icon} #{usd} · #{vef}"
rescue
  ""
end

def mpd
  mpc = `mpc -f '%title% --- %artist%'`
  song = mpc.split($/).first

  song.sub!('---', "by".foreground!(:lightblack))

  if mpc.match(/playing/)
    color = :blue
  elsif mpc.match(/paused/)
    color = :yellow
  else
    color = :red
    song = 'NOTHING PLAYING'.foreground!(:lightblack)
  end

  icon = ' MPD '.background!(color)

  "#{icon} #{song}"
    .action!('mpc -q toggle')
    .action!('mpc -q prev', 4)
    .action!('mpc -q next', 5)
    .action!('urxvt -e ncmpcpp', 3)
end

def pulseaudio
  pactl = `pactl list sinks`
  volume = pactl[/[0-9]+%/].to_i
  muted = pactl[/Mute: (yes|no)/, 1] == 'yes'

  # Prevent fuck ups.
  system 'pactl set-sink-volume 0 100%' if volume > 100


  if muted
    color = :red
  else
    color = :green
  end

  icon = ' VOL '.background!(color)

  volumebar = mkbar(volume)

  "#{icon} #{volumebar}"
    .action!('pactl set-sink-mute 0 toggle')
    .action!("[ #{volume} -lt 100 ] && pactl set-sink-volume 0 +5%", 4)
    .action!('pactl set-sink-volume 0 -5%', 5)
end

def bspwm
  desktops = JSON.parse(`bspc query -D`, symbolize_names: true)
  output = ''

  desktops.each do |name, info|
    desktop = ' ' * 4

    if info[:focused]
      desktop.underline!(:red)
    elsif info[:root] # Empty
      desktop.underline!(:foreground)
    else
      desktop.underline!(:black)
    end

    output << ' '
    output << desktop.action!("bspc desktop -f #{name}") 
  end

  output
    .action!('bspc desktop -f prev.occupied', 4)
    .action!('bspc desktop -f next.occupied', 5)
end

#
#
#
#

threads = []

threads << Thread.new do
  loop do
    update!(clock: clock)
    sleep 60 - Time.now.sec
  end
end

threads << Thread.new do
  loop do
    update!(calendar: calendar)

    t = Time.new
    seconds_until_tomorrow = (86400) - (t.hour * 3600) - (t.min * 60) - (t.sec)
    sleep seconds_until_tomorrow
  end
end

threads << Thread.new do
	loop do
		update!(memory: memory)
		sleep 1
	end
end

threads << Thread.new do
  loop do
    update!(bitcoin: bitcoin)
    sleep 600
  end
end

threads << Thread.new do
  update!(volume: pulseaudio)

  $listeners << pactl = open('| pactl subscribe change')

  pactl.each_line do |line|
    # Only care about sink changes
    update!(volume: pulseaudio) if line.include? 'sink'
  end
end

threads << Thread.new do
  if system 'mpc'
    update!(music: mpd)

    $listeners << mpc = open('| mpc idleloop player')

    mpc.each_line do
      update!(music: mpd)
    end
  else
    update!(music: '')
  end
end

threads << Thread.new do
  update!(desktops: bspwm)

  $listeners << bspc = open('| bspc subscribe desktop')

  bspc.each_line do
    update!(desktops: bspwm)
  end
end

threads.each(&:join)
