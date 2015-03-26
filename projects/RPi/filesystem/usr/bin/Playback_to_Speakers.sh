#!/bin/bash

# $1 added to support 1st line argument. i.e. "./Playback_to_Speakers.sh -q" will stop all the control information being displayed on screen

#Playback from AP to Speaker
amixer $1 -Dhw:sndrpiwsp cset name='Speaker Digital Volume' 128
# reset speaker mixer inputs
amixer $1 -Dhw:sndrpiwsp cset name='SPKOUTL Input 1' None
amixer $1 -Dhw:sndrpiwsp cset name='SPKOUTR Input 1' None
amixer $1 -Dhw:sndrpiwsp cset name='SPKOUTL Input 2' None
amixer $1 -Dhw:sndrpiwsp cset name='SPKOUTR Input 2' None
# Route AP to Speaker mixer
amixer $1 -Dhw:sndrpiwsp cset name='SPKOUTL Input 1' AIF1RX1
amixer $1 -Dhw:sndrpiwsp cset name='SPKOUTL Input 1 Volume' 32
amixer $1 -Dhw:sndrpiwsp cset name='SPKOUTR Input 1' AIF1RX2
amixer $1 -Dhw:sndrpiwsp cset name='SPKOUTR Input 1 Volume' 32
# Unmute speaker output
amixer $1 -Dhw:sndrpiwsp cset name='Speaker Digital Switch' on


# The following command can be used to test
# aplay -Dhw:sndrpiwsp -r 44100 -c 2 -f S32_LE <file>
