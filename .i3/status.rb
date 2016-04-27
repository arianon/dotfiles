#!/usr/bin/env ruby
require 'json'

def calendar
  {
    full_text: Time.now.strftime('%a, %d of %b')
  }
end

def clock
  {
    full_text: Time.now.strftime('%I:%M:%S %p')
  }
end

puts({ version: 1 }.to_json)
puts '[[]'

loop do
  puts ',' << [calendar, clock].to_json
  STDOUT.flush
  sleep 1
end
