# .bash_profile
export GTK_THEME=Adwaita:dark
# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

export _JAVA_AWT_WM_NONREPARENTING=1 # fix java apps blank screen
# auto startx on tty1
if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
  exec startx
fi
