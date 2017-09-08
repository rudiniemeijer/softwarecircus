-- blink.lua
-- Copyright (c) 2017 Rudi Niemeijer
-- MIT license

delaytime = 1000 -- ms between on and off
ledpin = 0   -- D0 (there is also an led at D4)
ledon = 0   -- state of the led
ledtimer = 1 -- Use timer 1 (can be 0 to 6)
gpio.mode(ledpin, gpio.OUTPUT) -- Set D0 as output
tmr.alarm(ledtimer, delaytime, tmr.ALARM_AUTO, function() -- Make function
  if ledon == 0 then -- was the led off just yet?
    ledon = 1        -- remember its on now
    gpio.write(ledpin, gpio.LOW)  -- and switch the led on
  else
    ledon = 0        -- remember its off now
    gpio.write(ledpin, gpio.HIGH) -- and switch the led off
  end
end)
