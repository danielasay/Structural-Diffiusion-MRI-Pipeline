#!/bin/bash


# Acpc align

cd /Users/Dan/Desktop/EDSD

for i in sub*; do

	cd ${i}/anat/

	acpcdetect \
	-noppm \
	-nopng \
	-notxt \
	-i ${i}_T1w.nii
	cd /Users/Dan/Desktop/EDSD

done 

tree tree /Users/admin/Desktop/EDSD
