-- resistancetothingspeak.lua
-- Copyright (c) 2017 Rudi Niemeijer
-- MIT license

URL = "http://api.thingspeak.com/update?api_key="

-- Change this
API_KEY = "the API key of the ThingSpeak channel"

function measure() 
  s = adc.read(0)
  print("Measured value of S is "..s)
  if wifi.sta.status() == 5 then
    http.get(URL..API_KEY.."&field1="..s)
  else
    print("No IP address. Use wifi.sta.config() first")
  end
end

tmr.alarm(3, 5000, tmr.ALARM_AUTO, measure) -- measure every 5 seconds
