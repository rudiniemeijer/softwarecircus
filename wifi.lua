-- NodeMCU remebers this, even after power-off or reset
-- so no need to run this more than once
wifi.setmode(wifi.STATION)
station_cfg = {}
station_cfg.ssid = "softwarecircus"
station_cfg.pwd = "toomanysecrets"
station_cfg.save = true
wifi.sta.config(station_cfg)
wifi.sta.connect()

-- Check the status of the IP-configuration in the console
-- print(wifi.sta.status()) -- Status 5 is A-OK
-- print(wifi.sta.getip())

-- Call a webhook, just for fun
http.get("http://maker.ifttt.com/trigger/testwifi/with/key/cKOv_7WOkun-XfI22a5Duw-yhCiJF61C-dn4NvuU-LI?value1=" .. wifi.sta.getmac() .. "&value2=" .. wifi.sta.getip())
