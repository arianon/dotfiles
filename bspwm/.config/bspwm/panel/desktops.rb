require 'colorize'

stat = `bspc control --get-status`.split ':'

# Get rid of the desktop and layout view.
stat = stat[1...-1]

# Split [layout
stat.map! { |x| x.split '', 2 }

layouts = []

stat.each do |dtop|
  case dtop.first
  when "O"
    layouts << dtop.last.blue
  when "o"
    layouts << dtop.last.yellow
  when "F"
    layouts << dtop.last.green
  when "f"
    layouts << dtop.last.black
  when "U"
    layouts << dtop.last.red
  when "u"
    layouts << dtop.last.magenta
  end
end

layouts.each { |x| puts x }
