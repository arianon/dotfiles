require_relative 'xresources'
require_relative 'helpers'

SIZE = 16
CHAR1 = ' '
CHAR2 = ' '

def mkbar(value)
  value = if value > 100 then 100 elsif value < 0 then 0 else value end
  value = (value / 100.0 * SIZE).round
  remainder = SIZE - value

  bar = ''

  if value > 0
    bar << (CHAR1 * value).background!(:foreground)
  end

  if remainder > 0
    bar << (CHAR2 * remainder).background!(:lightblack)
  end

  bar
end
