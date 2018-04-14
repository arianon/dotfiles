function milli2human -a ms
  if test ! $ms
    echo "usage: milli2human <milliseconds>"
    return 0
  end

  set milliseconds (expr $ms \% 1000)
  set seconds (expr $ms / 1000 \% 60)
  set minutes (expr $ms / 60000 \% 60)
  set hours (expr $ms / 3600000 \% 24)
  set days (expr $ms / 86400000)

  test $days -gt 0; and echo -n $days"d "
  test $hours -gt 0; and echo -n $hours"h "
  test $minutes -gt 0; and echo -n $minutes"m "
  test $seconds -gt 0; and echo -n $seconds"s"

  test $seconds -gt 0 -a $milliseconds -gt 0; and echo -n " "

  test $milliseconds -gt 0 -a $minutes -lt 1; and echo -n $milliseconds"ms"
end
