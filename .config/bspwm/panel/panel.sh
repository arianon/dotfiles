#! /bin/sh

. $(dirname $0)/panel-settings

if [ $(pgrep -cx panel) -gt 1 ] ; then
	printf "%s\n" "The panel is already running." >&2
	exit 1
fi

trap 'trap - TERM; kill 0' INT TERM QUIT EXIT

[ -e "$PANEL_FIFO" ] && rm "$PANEL_FIFO"
mkfifo "$PANEL_FIFO"


bspc config top_padding $panel_height
bspc control --subscribe > $PANEL_FIFO &
clock -i 30 -sf "$clock_format" > $PANEL_FIFO &
#ruby panel-base.rb > $PANEL_FIFO &
panel-mpd &
panel-volume & 
panel-wifi &

panel-base < $PANEL_FIFO | bar -f "$panel_font","$stlarch_font" -g x$panel_height -F "$fg" -B "$bg" | sh

wait
