#!/bin/bash

# $1 added to support 1st line argument. i.e. "./Record_from_Headset.sh -q" will stop all the control information being displayed on screen

# Record from Headset to AP
# Set the Input PGA Volume +20dB
amixer $1 -Dhw:sndrpiwsp cset name='IN1R Volume' 20
# Configure the input path for HPF with a low cut off for DC removal
amixer $1 -Dhw:sndrpiwsp cset name='IN1R Digital Volume' 128

amixer $1 -Dhw:sndrpiwsp cset name='LHPF1 Input 1' IN1R
amixer $1 -Dhw:sndrpiwsp cset name='LHPF1 Mode' High-pass
amixer $1 -Dhw:sndrpiwsp cset name='LHPF1 Coefficients' 240,3
# Configure the Audio Interface and volume 0dB
amixer $1 -Dhw:sndrpiwsp cset name='AIF1TX1 Input 1' LHPF1
amixer $1 -Dhw:sndrpiwsp cset name='AIF1TX1 Input 1 Volume' 32
amixer $1 -Dhw:sndrpiwsp cset name='AIF1TX2 Input 1' LHPF1
amixer $1 -Dhw:sndrpiwsp cset name='AIF1TX2 Input 1 Volume' 32
amixer $1 -Dhw:sndrpiwsp cset name='Headset Mic Switch' on
# This is set up as a dual mono record.


# The following command can be used to test
# arecord -Dhw:sndrpiwsp -r 44100 -c 2 -f S32_LE <file>
