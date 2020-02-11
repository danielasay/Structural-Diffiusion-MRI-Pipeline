#!/bin/bash

freesurfer

output=~/Desktop/BIDS/EDSD/deriv

# Big Ventricles

cd $output
> subjects_big.txt

for i in sub-F*; do
	echo ${i}/${i}BIGVENTRICLE__recon_all/${i} >> subjects_big.txt
done

asegstats2table \
--subjectsfile subjects_big.txt \
--meas volume \
--skip \
--delimiter comma \
--tablefile ${output}/aseg_big.csv