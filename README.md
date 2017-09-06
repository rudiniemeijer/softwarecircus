# softwarecircus
## Install drivers
In order to communicate with a NodeMCU via USB, a driver is needed. Drivers here are for Windows (CP210x_Windows_Drivers.zip) and OS X (SiLabsUSBDriverDisk.dmg). 

## Integrated development environment
A complete IDE is available, in the form of ESPlorer.jar, a Java program. Java needs to be installed on your computer.

## An introduction to Lua
In order to give you a running start, I've written a small introductory leaflet for Lua, called LUA-INTRO.md.

## Lua example programs for the NodeMCU used at the Software Circus 2017 Cloudbusting event
* `blink.lua`  
Flashes the D0 led on the NodeMCU with a 1 Hz frequency.
* `wifi.lua`  
Sets the wifi credentials and tests the connectivity by calling a webhook.
* `testpir.lua`  
Prints a message onscreen if a PIR sensor fires.
* `pirtoifttt.lua`  
Calls a webhook on IFTTT.com once a connected PIR sensor fires. Name of the IFTTT applet and the corresponding API KEY need to be filled in.
* `testanalog.lua`  
Print the current value of the analog port on screen.  
* `resistancetothingspeak.lua`   
Calls a webhook on ThingSpeak.com with the current value of the analog port. The API KEY of the ThingSpeak channels needs to be filled in.
