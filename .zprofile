export GTK_THEME=Adwaita:dark # for GTK 3 and 4 apps
export QT_QPA_PLATFORMTHEME=gtk2 # for Qt 5 and 6 apps

# Get the aliases and functions
if [ -f ~/.zshrc ] ; then
	. ~/.zshrc
fi

export _JAVA_AWT_WM_NONREPARENTING=1 # fix java apps blank screen
# auto startx on tty1
if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
  exec startx
fi
