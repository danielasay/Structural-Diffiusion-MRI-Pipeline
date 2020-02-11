#!/bin/bash

freesurfer

output=~/Desktop/BIDS/EDSD/deriv

# Regular

cd $output
> subjects.txt

for i in sub-F*; do
	echo ${i}/${i}_recon_all/${i} >> subjects.txt
done

asegstats2table \
--subjectsfile subjects.txt \
--meas volume \
--skip \
--delimiter comma \
--tablefile ${output}/aseg.csv


# Big Ventricles

#asegstats2table \
#--subjectsfile subjects_big.txt \
#--meas volume \
#--skip \
#--delimiter comma \
#--tablefile ${output}/aseg-bigventricles.csv