#!/bin/bash

#Free View Screenshots

freesurfer

cd ~/Documents/EDSD/deriv/freesurfer_subs


OUTPUT=~/Documents/EDSD/deriv/freesurfer_subs/${i}/segmentHA

for i in sub*; do


freeview -v \
${i}/mri/T1.mgz \
-v ${i}/mri/lh.hippoAmygLabels-T1.v21.CA.mgz:colormap=lut:opacity=0.3 \
-v ${i}/mri/rh.hippoAmygLabels-T1.v21.CA.mgz:colormap=lut:opacity=0.3 \
--viewport coronal \
--layout 1 \
--viewsize 800 800 \
--zoom 1.5 \
--screenshot ${OUTPUT}/${i}-AMYHIP_screenshot.png \

done


