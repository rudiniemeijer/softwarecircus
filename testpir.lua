-- testpir.lua
-- Copyright (c) 2017 Rudi Niemeijer
-- MIT license

ledpin, pirsensorpin = 4, 2
gpio.mode(pirsensorpin, gpio.INT, gpio.PULLUP)
gpio.mode(ledpin, gpio.OUTPUT)

function movement()
  print("PIR sensor detected movement")
  gpio.write(ledpin, gpio.LOW)                    -- gpio.LOW is led ON
  tmr.alarm(0, 2000, tmr.ALARM_SINGLE, function() -- led off after 2 seconden
    gpio.write(ledpin, gpio.HIGH)                 -- gpio.HIGH is led OFF
  end)
end

-- Call the movement function if the signal goes from low to high ("up")
gpio.trig(pirsensorpin, "up", movement) -- Reference to the movement function
