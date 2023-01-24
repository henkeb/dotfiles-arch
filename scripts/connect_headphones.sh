#!/bin/bash
CONNECTED_DEVICE=$(bluetoothctl devices | cut -f2 -d' ' | while read uuid; do bluetoothctl info $uuid; done|grep -e "Device\|Connected\|Name")
HEADPHONES_MAC_ADRESS=38:18:4C:96:36:33

if echo "$CONNECTED_DEVICE" | grep -q "Connected: yes"; then
  INDEX=$(pacmd list-cards | grep "device.description = \"WH-1000XM3\"" -B 5 | head -n1 | tr -s ' ' | cut -d ' ' -f3)
  pacmd set-card-profile $INDEX a2dp_sink
else
  bluetoothctl connect $HEADPHONES_MAC_ADRESS
fi
