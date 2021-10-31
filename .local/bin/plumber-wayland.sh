#!/bin/sh

clpbrd="$(wl-paste)"; [ -z "$clpbrd" ] && exit

funcs="ddg|ddg-img|yt|wikipedia|wikipedia|wiktionary|maps|ebay|gotourl|plyvid|plyvid-lowquality|plyvid-fullscreen|tor-plyvid|plyaudio|tor-plyaudio|custom|custom-stdout"

func="$(echo $funcs | sed -Ee 's/\|/\n/g' | bemenu.sh -l 7 -p Plumb_clipboard_to: )"

brwsr="firefox"
vidviewer="mpv"
tor="torsocks"
mpverrhndlr=" && true || notify-send 'Mpv closed with an error' "

case $func in
	ddg) 
	"$brwsr" "https://duckduckgo.com/?q=$clpbrd&kae=t"
	;;
	ddg-img) 
	"$brwsr" "https://duckduckgo.com/?q=$clpbrd&kae=t&iax=images&iar=images&ia=images"
	;;
	yt) 
	"$brwsr" "https://www.youtube.com/results?search_query=$clpbrd"
	;;
	wikipedia) 
	"$brwsr" "https://en.wikipedia.org/wiki/$clpbrd"
	;;
	wikipedia-pl) 
	"$brwsr" "https://pl.wikipedia.org/wiki/$clpbrd"
	;;
	wiktionary) 
	"$brwsr" "https://en.wiktionary.org/wiki/$clpbrd"
	;;
	maps) 
	"$brwsr" "https://www.openstreetmap.org/search?query=$clpbrd"
	;;
	ebay) 
	"$brwsr" "https://www.ebay.com/sch/$clpbrd"
	;;
	gotourl) 
	"$brwsr" "$clpbrd"
	;;
	plyvid) 
	"$vidviewer" "$clpbrd" 
	;;
	plyvid-lowquality) 
	"$vidviewer" --ytdl-format='\bestvideo[height<=?480]+bestaudio/worst\' "$clpbrd" 
	;;
	plyvid-fullscreen) 
	"$vidviewer" --fullscreen "$clpbrd" 
	;;
	tor-plyaudio) 
	"$tor" "$vidviewer" --no-video --input-ipc-server=/tmp/mpvsocket "$clpbrd" 
	;;
	plyaudio) 
	"$vidviewer" --no-video --input-ipc-server=/tmp/mpvsocket "$clpbrd" && true || notify-send 'Mpv closed with an error'
	;;
	tor-plyvid) 
	"$tor" "$vidviewer" "$clpbrd" 
	;;
	custom) 
	echo "$clpbrd" | $(echo | bemenu.sh -p "Command:")
	;;
	custom-stdout) 
	echo "$clpbrd" | $(echo | bemenu.sh -p "Command:") | wl-copy -n
	;;
esac

