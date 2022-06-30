#!/bin/bash
status=$( playerctl status 2>/dev/null )
fallback_cover=$HOME/.config/eww/scripts/fallback.jpg
cover=/tmp/cover.jpg
get_cover(){
	players=($(playerctl -l))
	if [ "${players[0]}" == "mpd" ] ;then
		fname="$(playerctl metadata | grep :url )"
		file=${fname:32}
	else
		file=$(playerctl metadata | grep :artUrl | awk '{print $3}')
	fi
    check=${file:0:4}
    if [[ $check == "file" || $check == "http" ]] ; then
        ffmpeg -loglevel 0 -y -i "$file" $cover
        echo $cover
    else
        echo $fallback_cover
    fi
}
    
get_title(){
    zscroll -l 21 -d 0.2  -M "playerctl status" -m "Playing" "-s 1" -m "Paused" "-s 0"  -u true $HOME/.config/eww/scripts/music_info.sh
}
# if [[ "$status" == "Paused" || "$status" == "Playing"  ]] ; then
#     get_cover
# fi
if [ "$1" == "--title" ]  ; then
	get_title
elif [ "$1" == "--cover" ] ; then
    get_cover
fi
