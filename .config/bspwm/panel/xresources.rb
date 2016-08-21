
module Xresources
  @colors = Hash[
    %i[foreground background black red green yellow blue magenta cyan white lightblack lightred lightgreen lightyellow lightblue lightmagenta lightcyan lightwhite]
    .zip(
      `xrq {fore,back}ground color{0..15}`.split($/).map! { |c| c.delete('#') }
    )
  ]

  @colors.each do |name, color|
    define_singleton_method(name) { color }
  end

  def self.[](method)
    send(method)
  end
end
