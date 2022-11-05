#!/bin/sh

# dbus
systemctl --user import-environment DISPLAY XAUTHORITY
dbus-update-activation-environment DISPLAY XAUTHORITY

# autostart
redshift &
deadd-notification-center &

while true; do
  i3 2> ~/.cache/i3.log
done
