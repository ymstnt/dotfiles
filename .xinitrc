#!/bin/sh
setxkbmap hu

# dbus
systemctl --user import-environment DISPLAY XAUTHORITY
dbus-update-activation-environment DISPLAY XAUTHORITY

# autostart
redshift &
deadd-notification-center &

while true; do
  bspwm 2> ~/.cache/bspwm.log
done
