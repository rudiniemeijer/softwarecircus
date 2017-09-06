-- pirtoifttt.lua
-- Copyright (c) 2017 Rudi Niemeijer
-- MIT license

ledpin, pirsensorpin = 4, 2
gpio.mode(pirsensorpin, gpio.INT, gpio.PULLUP)
gpio.mode(ledpin, gpio.OUTPUT)

-- Change this
APPLET = "put the name of the IFTTT applet here"
THE_API_KEY = "put the API key from IFTTT here"

URL = "http://maker.ifttt.com/trigger/"..APPLET.."/with/key/"

function movement()
  print(tmr.time() .. "PIR sensor detected movement")
  gpio.write(ledpin, gpio.LOW)                    -- gpio.LOW is led ON
  if wifi.sta.status() == 5 then                  -- Valid IP address?
    http.get(URL..THE_API_KEY.."?value1="..tmr.time())
    print(URL..THE_API_KEY.."?value1="..tmr.time())
  else
    print("No IP address. Use wifi.sta.config() first")
  end
  tmr.alarm(0, 2000, tmr.ALARM_SINGLE, function() -- Led off after 2 seconden
    gpio.write(ledpin, gpio.HIGH)                 -- gpio.HIGH is led OFF
  end)
end

-- Call the movement function if the signal goes from low to high ("up")
gpio.trig(pirsensorpin, "up", movement)           -- Reference to the movement function
