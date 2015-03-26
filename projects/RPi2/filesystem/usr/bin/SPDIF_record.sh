#!/bin/bash

# $1 added to support 1st line argument. i.e. "./SPDIF_record.sh -q" will stop all the control information being displayed on screen

#Record from SPDIF in
amixer $1 -Dhw:sndrpiwsp cset name='SPDIF In Switch' on
# Setup WM5102 AIF1 stereo output source from AIF2 (data from WM8804), 0dB Gain
amixer $1 -Dhw:sndrpiwsp cset name='AIF1TX1 Input 1' AIF2RX1
amixer $1 -Dhw:sndrpiwsp cset name='AIF1TX1 Input 1 Volume' 32
amixer $1 -Dhw:sndrpiwsp cset name='AIF1TX2 Input 1' AIF2RX2
amixer $1 -Dhw:sndrpiwsp cset name='AIF1TX2 Input 1 Volume' 32

# The following command can be used to test
# arecord -Dhw:sndrpiwsp -r 44100 -c 2 -f S32_LE <file>



