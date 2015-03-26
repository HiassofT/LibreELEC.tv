#!/bin/bash

# $1 added to support 1st line argument. i.e. "./SPDIF_playback.sh -q" will stop all the control information being displayed on screen

#Playback to SPDIF Out Enable
amixer $1 -Dhw:sndrpiwsp cset name='SPDIF Out Switch' on
# Setup WM5102 AIF2 stereo output source from AIF1 (data from AP), 0dB Gain
amixer $1 -Dhw:sndrpiwsp cset name='Tx Source' AIF
amixer $1 -Dhw:sndrpiwsp cset name='AIF2TX1 Input 1' AIF1RX1
amixer $1 -Dhw:sndrpiwsp cset name='AIF2TX1 Input 1 Volume' 32
amixer $1 -Dhw:sndrpiwsp cset name='AIF2TX2 Input 1' AIF1RX2
amixer $1 -Dhw:sndrpiwsp cset name='AIF2TX2 Input 1 Volume' 32

# The following command can be used to test
# aplay -Dhw:sndrpiwsp -r 44100 -c 2 -f S32_LE <file>
