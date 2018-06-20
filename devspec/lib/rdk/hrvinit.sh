#!/bin/sh

if [ ! -f /tmp/warehouse_reset_suppress_reboot ]; then
         echo "Warehouse Reset:Restarting STB after hrvinit WH Reset flag check..!"
         echo "Warehouse Reset:Deleting receiver.conf override"
         rm /opt/receiver.conf
         sh /rebootNow.sh -s warehouseReset
fi
