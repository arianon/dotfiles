require_relative 'xresources'

class String
  def foreground!(color)
    color = Xresources[color]
    replace "%{F#FF#{color}}#{self}%{F-}"
  end

  def background!(color)
    reverse!.foreground!(color)
  end

  def underline!(color = nil)
    if color
      color = Xresources[color]
      replace "%{+u}%{U#FF#{color}}#{self}%{U-}%{-u}"
    else
      replace "%{+u}#{self}%{-u}"
    end
  end

  def action!(command = ':', button = '')
    replace "%{A#{button}:#{command.gsub(':', '\:')}:}#{self}%{A}"
  end

  def reverse!
    replace "%{R}#{self}%{R}"
  end
end
