# softwarecircus
## About  
The files in this repository are part of the workshop *Build your own Internet of Things appliance*, on *Software Circus 2017 Cloudbusting*. Attendees of the workshop create their own real-life IoT appliance using a microcontroller called NodeMCU and some clever software that connects to the internet.

![Image of a NodeMCU on a breadboard](https://github.com/rudiniemeijer/softwarecircus/blob/master/nodemcu-on-breadboard.jpg)

In order to program the NodeMCU, a computer with USB is required (modern laptops with USB-C require a USB 2.0/3.0 hub, for instance the MacBook Pro). Drivers and an IDE need to be installed before programming can take off. Attendees are encouraged to do install the appropriate driver and download the IDE (and if nessecary, Java) beforehand, to prevent wifi bandwidth degradation during the workshop.

## Install driver
In order to communicate with a NodeMCU via USB, a driver is needed. Drivers here are for Windows ([CP210x_Windows_Drivers.zip][https://github.com/rudiniemeijer/softwarecircus/blob/master/CP210x_Windows_Drivers.zip]) and OS X ([SiLabsUSBDriverDisk.dmg][https://github.com/rudiniemeijer/softwarecircus/blob/master/SiLabsUSBDriverDisk.dmg]). Install on your favorite platform and you're good to go.

## Integrated development environment
A complete IDE is available, in the form of ESPlorer.jar, a Java program. Java needs to be already installed on your computer though. If nothing happens when you doubleclick ESPlorer.jar, you need to install Java as well.

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
