#!/bin/bash

# Load Variables

freesurfer

output_reg=~/compute/EDSD/deriv/freesurfer_subs
output_big=~/compute/EDSD/deriv/freesurfer_subs_bigvent

# Regular

cd ~/compute/EDSD/deriv/freesurfer_subs

for i in sub-F*; do
echo freesurfer_subs/${i} >> subjects.txt
done

asegstats2table \
--subjectsfile subjects.txt \
--meas volume \
--skip \
--delimiter comma \
--tablefile ${output_reg}/aseg.csv

#Big Ventricles

cd ~/compute/EDSD/deriv/freesurfer_subs_bigvent

for i in sub-F*; do
echo freesurfer_subs_bigvent/${i} >> bigvent_subjects.txt
done

asegstats2table \
--subjectsfile bigvent_subjects.txt \
--meas volume \
--skip \
--delimiter comma \
--tablefile ${output_big}/bigvent_aseg.csv



