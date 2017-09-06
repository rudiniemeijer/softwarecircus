# softwarecircus
Lua example programs for the NodeMCU used at the Software Circus 2017 Cloudbusting event

* blink.lua  
Flashes the D0 led on the NodeMCU with a 1 Hz frequency.
* wifi.lua  
Sets the wifi credentials and tests the connectivity by calling a webhook.
* testpir.lua  
Prints a message onscreen if a PIR sensor fires.
* pirtoifttt.lua  
Calls a webhook on IFTTT.com once a connected PIR sensor fires. Name of the IFTTT applet and the corresponding API KEY need to be filled in.
