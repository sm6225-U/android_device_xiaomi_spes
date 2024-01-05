#! /system/bin/sh
#echo "Ultra Playback test"
#adb shell mifunctiontest audioplayback ultrareceiver
spk=1
rec=2
mic1=3
mic2=4
playback=5
playback_rcv=6
playback_ultra=61
mic1_record=7
mic2_record=8
ultra_mic_record=81
enable=1
disable=0
open="-Y"
close="-N"
pname_play="tinyplay"
pbname="loopbacktest"

if test $2 -eq $enable
then
	loopbacktest $open "$1" 13
	if test $1 -eq $playback_ultra
	then
		tinymix 'Audio Stream 0 App Type Cfg' 69936 15 96000 189 0
		tinyplay /vendor/etc/ultrasound.wav
		pkill -f $pname_play
		loopbacktest $close "$1"
	fi
elif test $2 -eq $disable
then
	if test $1 -eq $playback_ultra
	then
	#pkill -f $pbname
	pkill -f $pname_play
	loopbacktest $close "$1"
	else
	loopbacktest $close "$1"
	fi
else
	echo "ultra playback input error ctl cmd!"
fi
