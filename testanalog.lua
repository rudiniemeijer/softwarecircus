function measure() 
  s = adc.read(0)
  print("Measured value of S is "..s)
end

tmr.alarm(3, 1000, tmr.ALARM_AUTO, measure) -- measure every 2 seconds
