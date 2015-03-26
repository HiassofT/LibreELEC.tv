#!/bin/bash

# Record from onboard stereo DMICs to AP

# Set the digital input gain to -6dB
amixer $1 -Dhw:sndrpiwsp cset name='IN2L Digital Volume' 116
amixer $1 -Dhw:sndrpiwsp cset name='IN2R Digital Volume' 116
# Configure the input path for HPF with a low cut off for DC removal
amixer $1 -Dhw:sndrpiwsp cset name='LHPF1 Input 1' IN2L
amixer $1 -Dhw:sndrpiwsp cset name='LHPF2 Input 1' IN2R
amixer $1 -Dhw:sndrpiwsp cset name='LHPF1 Mode' High-pass
amixer $1 -Dhw:sndrpiwsp cset name='LHPF2 Mode' High-pass
amixer $1 -Dhw:sndrpiwsp cset name='LHPF1 Coefficients' 240,3
amixer $1 -Dhw:sndrpiwsp cset name='LHPF2 Coefficients' 240,3
# Configure the Audio Interface and volume 0dB
amixer $1 -Dhw:sndrpiwsp cset name='AIF1TX1 Input 1' LHPF1
amixer $1 -Dhw:sndrpiwsp cset name='AIF1TX1 Input 1 Volume' 32
amixer $1 -Dhw:sndrpiwsp cset name='AIF1TX2 Input 1' LHPF2
amixer $1 -Dhw:sndrpiwsp cset name='AIF1TX2 Input 1 Volume' 32
amixer $1 -Dhw:sndrpiwsp cset name='DMIC Switch' on


# The following command should be used to test
# arecord -Dhw:sndrpiwsp -r 44100 -c 2 -f S32_LE <file>



