# Variables and typing  
    variable = value  
    local a = 10  
    b = true  
    c = false  
    d = nil  
    e, f, g = 5, "hello", 6.1  

# Operators
    or
    and
    <  >  <=  >=  ~=  ==  ..
    +  -
    *  /  %
    not   #   -
    ^

# Conditional loops
    while i <= 5 do
    end
    
    repeat
      break
    until i > 10
    
    for i = 1, 10, 2 do
    end

# Functions
    function dothis()
      local x, y = dothat(4, 5)
      return x^y
    end
    
    function dothat(a1, a2)
      return a1*2, a2*3
    end

# Tables
    x = 5
    a = {}
    b = {sl1 = x, sl2 = 3}
    
    a[1] = 20
    
    print(a[1])

# Strings
    s = "Software Circus"
    print(#s) -- 15
    
    t = "123" .. 4 .. "56"
    
# Numbers and calculations
    a = 3.1415926
    b = a * 2
    
    c = node.random() -- 0..1
    d = node.random(10) -- 1..10

# Files
    file.open("values.txt")
    file.write(1)
    file.write(2)
    file.writeln(3)
    file.close
    file.open("othervalues")
    a = {}
    a = file.readline()
    file.close()

# Input and output
    gpio.mode(1, gpio.INPUT,
      gpio.PULLUP)
    if gpio.read(1) then
      print("high")
    else
      print("low")
    end
    print(adc.read(0))

# Timers and events
    tmr.delay(1000)
    start = tmr.now()
    
    tmr.alarm(0, 1000,
      tmr.ALARM_AUTO,
      function()
        print("hallo")
      end)
