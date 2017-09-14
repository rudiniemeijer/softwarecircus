# softwarecircus
## Preparations before the workshop
* Install the USB driver on your laptop (see "Install driver")
* Download the IDE (see "Integrated development environment")  

Need wifi to download the driver and IDE? We've got you covered. At least in the hangar, that is. You can use the _SoftwareCircus2017_ hotspot, with password _cloudbusting_.

## IF This Then That
Create an account for the IFTTT.com service. You'll need a (free) account in order to create applets. Applets are defined by an _incoming_ and an _outgoing_ service. We'll be using Webhook as the incoming service, and a service you'll select as the outgoing service. That could be sending a GMail, sending a tweet via Twitter, switching on a LIFX light, etc. After you've created an applet, click on the Webhook icon and click on the settings icon to look up the API key. The name you've given your applet, plus the API key, are all that is needed to get the `pirtoifttt.lua` script running.

## The Book
If want to learn more about the Internet of Things you could decide to buy [my book](https://www.bol.com/nl/p/zelf-iot-toepassing-maken-alledaagse-voorwerpen-probleemloos-met-internet-of-things-verbinden/9200000074414682/?suggestionType=featured_product&suggestedFor=zelf%20een%20i&originalSearchContext=media_all&originalSection=main). Greatly appreciated.

## About  
The files in this repository are part of the workshop *Build your own Internet of Things appliance*, on *Software Circus 2017 Cloudbusting*. Attendees of the workshop create their own real-life IoT appliance using a microcontroller called NodeMCU and some clever software that connects to the internet.

![Image of a NodeMCU on a breadboard](https://github.com/rudiniemeijer/softwarecircus/blob/master/nodemcu-on-breadboard.jpg)

In order to program the NodeMCU, a computer with USB is required (modern laptops with USB-C require a USB 2.0/3.0 hub, for instance the MacBook Pro). Drivers and an IDE need to be installed before programming can take off. Attendees are encouraged to install the appropriate driver and download the IDE (and if nessecary, Java) beforehand, to prevent wifi bandwidth degradation during the workshop.

## Install driver
In order to communicate with a NodeMCU via USB, a driver is needed. Drivers here are for Windows ([CP210x_Windows_Drivers.zip](https://github.com/rudiniemeijer/softwarecircus/blob/master/CP210x_Windows_Drivers.zip)) and OS X ([SiLabsUSBDriverDisk.dmg](https://github.com/rudiniemeijer/softwarecircus/blob/master/SiLabsUSBDriverDisk.dmg)). Install on your favorite platform and you're good to go. Word is, you don't need a driver with Linux, as it's part of the distro. If you want to share your milage, please contact me and I'll put your notes here.

## Integrated development environment
A complete IDE is available, in the form of [ESPlorer.jar](https://github.com/rudiniemeijer/softwarecircus/blob/master/ESPlorer.jar), a Java program. Java needs to be already installed on your computer though. If nothing happens when you doubleclick ESPlorer.jar, you need to install Java as well.

## An introduction to Lua
In order to give you a running start, I've written a small introductory leaflet for Lua, called [LUA-INTRO.md](https://github.com/rudiniemeijer/softwarecircus/blob/master/LUA-INTRO.md).

## Four projects
During the workshop, four projects were undertaken by the attendees:
* Make your led flash
* Connect to the internet
* A sensor that fires
* Measuring resistance

The first project, _Make your led flash_, did involve mounting the NodeMCU onto a breadboard, but no further wires or parts. Most attendees got their NodeMCU's on the breadboard just fine, using the schematic above as a guide. Mounting it involves a considerable two-thumbs push, after which the breadboard gives a satisfying 'clack'. Software from `blink.lua` below was uploaded onto the NodeMCU, which resulted in a flashing led. Attendees were challenged to change the delay parameter in order to make the led flash slower and faster. Also, led d0 was discussed and ways to have leds d0 and d4 flash interchangably.

The second project, _Connect to the internet_, was just about uploading the `wifi.lua` script. The wifi parameters were already set straight in the script and will need alteration for you own wifi hotspot situation. The script called a webhook every 30 seconds, with which the MAC address of the NodeMCU was sent, over the internet, through the IFTTT service, to a Google Spreadsheet that was shown a the big screen. Also, with each call to the webhook, an iPhone beeped. With 30 NodeMCU's calling home each 30 seconds, for a brief time there was a lot of beeping and buzzing.

![Image of a PIR sensor connected to a NodeMCU](https://github.com/rudiniemeijer/softwarecircus/blob/master/diagram-of-pir-to-nodemcu.jpg)

The third project, _A sensor that fires_, involved a passive infrared sensor that was connected to the NodeMCU with three wires. One wire connected the PIR sensor to the USB power line of the NodeMCU, another connected the grounds of PIR sensor and NodeMCU. Finally, the output of the PIR sensor was connected to the pin marked _d2_ on the NodeMCU. At the event, we found out that some NodeMCU had faulty silkscreen, in that there were _two_ datalines marked _d2_: _d0_, _d2_, _d2_, _d3_, etc. THe first _d2_ was actually _d1_, so that the PIR sensor had to be connected to the _second_ _d2_. After downlading `pirtoifttt.lua` and creating an applet at IFTTT with Webhook as incoming service, this part of the code had to be changed:

```-- Change this
APPLET = "put the name of the IFTTT applet here"
THE_API_KEY = "put the API key from IFTTT here"
```

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

## Using init.lua
If you want to auto execute a lua script, you can put a `dofile("yourscript.lua")` inside a script that you name `init.lua`. Everytime you reboot the NodeMCU, `init.lua` is executed, which in turn runs your script. Be very careful with this feature though, as that auto execute happens in microseconds. If your script contains a bug that reboots the NodeMCU, you end up with an endless loop of rebooting.

## (Re) flashing NodeMCU firmware
It happens that a NodeMCU becomes unresponsive, usually as a result of calling a buggy lua script from an init.lua. You can use the python script `esptool.py` to reflash your NodeMCU, effectively resetting to 'factory' defaults. Examine the `flashamica.sh` shellscript in this repository to see how and what files you need (they're all here as well).
