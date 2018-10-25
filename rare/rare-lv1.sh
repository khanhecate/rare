#!/bin/bash
echo "Starting RARe LV 1 ....." && sleep 2
if [[ $EUID -ne 0 ]]; then
	echo "are you root ?"
	exit 
	else
	./wh.sh
fi
echo "Raid Auto Replaced lv 1 " && echo "ok"
echo "welcome to RARe ~ Pilih service yang akan anda gunakan "
echo "1.Select disk to mark that fail disk"
echo "2.Restore data after Replaced new disk"
echo "3.Restore Boot"
printf 'pilih menu di atas :'
read menu
case $menu in
	1 )cd app && ./mark-fail.sh
		;;
	2 )cd app && ./re.sh
		;;
	3 )cd app && ./boot.sh
		;;
	* )echo "pilih lah nomor menu dia atas" && exit 1	
esac
