local os = {
   date = os.date,
   clock = os.clock
}

local format = "%A, %B %dth %I:%M %p"

while true do
   -- Save current time.
   local t = os.clock()
   
   print("%{c}" .. os.date(format))

   -- Wait until the next minute passes to update.
   while (os.clock() - t) < (60 - os.date("%M")) do
      -- Do nothing in the meantime.
   end
end
