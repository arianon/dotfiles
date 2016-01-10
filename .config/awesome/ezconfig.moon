-- require.path ..=  ';/usr/share/awesome/lib/?/init.lua;/usr/share/awesome/lib/?.lua'

-- Usage:
-- ezconfig = require 'ezconfig'
--
-- globalkeys = ezconfig.keys
--   ['M-<Left>']: awful.tag.viewprev
--   ['M-<Right>']: awful.tag.viewnext
--   ['M-S-j']: -> awful.client.swap.byidx  1
--   ['M-S-k']: -> awful.client.swap.byidx -1


-- awful = require "awful"
:
ezconfig = {}
ezconfig.modkey = 'Mod4'

split = (s, sep = "-") ->
  [i for i in string.gmatch s, "([^#{sep}]+)"]


to_modkey = (key) ->
  switch key
    when "M" then ezconfig.modkey
    when "S" then "Shift"
    when "C" then "Ctrl"


ezconfig_key = (keydef) ->
  keys = split keydef

  mods = [to_modkey k for k in *keys]
  k = keys[#keys]

  {:mods, :k}

import mods, k from ezconfig_key("M-S-a")

print unpack mods
print k