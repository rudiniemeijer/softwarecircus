-- NodeMCU remebers this, even after power-off or reset
-- so no need to run this more than once
wifi.setmode(wifi.STATION)
wifi.sta.config("softwarecircus", "toomanysecrets")
wifi.sta.connect()

-- Check the status of the IP-configuration
print(wifi.sta.status()) -- Status 5 is A-OK
print(wifi.sta.getip())
