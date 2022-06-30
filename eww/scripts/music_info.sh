#!/bin/bash
status=$( playerctl status 2>/dev/null )
if [ ! -z $status ]; then
	playerctl metadata -f "{{title}} | {{artist}}"
else 
	echo "Nothing playing"
fi
