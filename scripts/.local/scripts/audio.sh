#!/bin/bash
CURRENT=$(pactl info | grep "Default Sink" | cut -d " " -f3)
if [ "$CURRENT" == "alsa_output.usb-MediaTek_Inc_Dell_HR024_Audio_Receiver_0000000000000000-00.analog-stereo" ]; then
    pactl set-default-sink alsa_output.pci-0000_04_00.6.HiFi__Speaker__sink 
else
    pactl set-default-sink alsa_output.usb-MediaTek_Inc_Dell_HR024_Audio_Receiver_0000000000000000-00.analog-stereo
fi
