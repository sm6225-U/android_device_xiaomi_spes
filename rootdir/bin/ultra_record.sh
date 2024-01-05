#! /system/bin/sh
#echo "ultra record test"
spk=1
rec=2
mic1=3
mic2=4
playback=5
playback_rcv=6
mic1_record=7
mic2_record=8
ultra_mic_record=81
enable=1
disable=0
open="-Y"
close="-N"
pname_play="tinycap"
pbname="loopbacktest"


if test $2 -eq $enable
then
	loopbacktest $open "$1" 13
	if test $1 -eq $ultra_mic_record
	then
		#snprintf(ultra_cap_sec, len, "tinycap /sdcard/us_mic.wav -D 0 -d 09 -r 96000 -b 16 -c 2 -p 960 -n 6 -T %s", argv[3]);
		#ultra_record.sh 8 1 96000 16 1 3
		tinycap /sdcard/us_mic.wav -r "$3" -b "$4" -c "$5" -T "$6"

		loopbacktest $close "$1"
		pkill -f $pbname
	else
		echo "input error cmd!"
	fi
else
	echo "ultra record input error ctl cmd!"
fi
