#!/bin/bash

# Clean setup
amixer $1 -Dhw:sndrpiwsp cset name='HPOUT1 Digital Switch' off
amixer $1 -Dhw:sndrpiwsp cset name='HPOUT2 Digital Switch' off
amixer $1 -Dhw:sndrpiwsp cset name='SPDIF Out Switch' off
amixer $1 -Dhw:sndrpiwsp cset name='SPDIF In Switch' off
amixer $1 -Dhw:sndrpiwsp cset name='Tx Source' AIF
amixer $1 -Dhw:sndrpiwsp cset name='AIF2TX1 Input 1' None
amixer $1 -Dhw:sndrpiwsp cset name='AIF2TX2 Input 1' None
amixer $1 -Dhw:sndrpiwsp cset name='AIF1TX1 Input 1' None
amixer $1 -Dhw:sndrpiwsp cset name='AIF1TX2 Input 1' None
amixer $1 -Dhw:sndrpiwsp cset name='HPOUT1L Input 1' None
amixer $1 -Dhw:sndrpiwsp cset name='HPOUT1R Input 1' None
amixer $1 -Dhw:sndrpiwsp cset name='HPOUT1L Input 2' None
amixer $1 -Dhw:sndrpiwsp cset name='HPOUT1R Input 2' None
amixer $1 -Dhw:sndrpiwsp cset name='HPOUT2L Input 1' None
amixer $1 -Dhw:sndrpiwsp cset name='HPOUT2R Input 1' None
amixer $1 -Dhw:sndrpiwsp cset name='HPOUT2L Input 2' None
amixer $1 -Dhw:sndrpiwsp cset name='HPOUT2R Input 2' None
amixer $1 -Dhw:sndrpiwsp cset name='Headset Mic Switch' off
amixer $1 -Dhw:sndrpiwsp cset name='DMIC Switch' off
amixer $1 -Dhw:sndrpiwsp cset name='SPKOUTL Input 1' None
amixer $1 -Dhw:sndrpiwsp cset name='SPKOUTR Input 1' None
amixer $1 -Dhw:sndrpiwsp cset name='SPKOUTL Input 2' None
amixer $1 -Dhw:sndrpiwsp cset name='SPKOUTR Input 2' None
amixer $1 -Dhw:sndrpiwsp cset name='Speaker Digital Switch' off


