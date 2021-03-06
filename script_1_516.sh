#!/bin/bash

# DCM2NIIX for T1 images

cd /Users/admin/Desktop/BIDS/EDSD

for i in sub*; do 

mkdir ${i}/anat

dcm2niix \
  -o ${i}/anat/ \
  -x n \
  -f ${i}_T1w \
  -z n \
  ${i}/DICOM/mprage # input DICOM directory

 mkdir ${i}/dwi

dcm2niix \
	-o ${i}/dwi \
	-f ${i}_dwi \
	-z y \
	${i}/DICOM/diff # input DICOM directory

done

# Acpc align

cd /Users/admin/Desktop/BIDS/EDSD

for i in sub*; do

	cd /Users/admin/Desktop/BIDS/EDSD/${i}/anat/

	acpcdetect \
	-noppm \
	-nopng \
	-notxt \
	-i ${i}_T1w.nii

done 

cd /Users/admin/Desktop/BIDS/EDSD/

for i in sub*; do

	cd /Users/admin/Desktop/BIDS/EDSD/deriv \

	mkdir ${i}/ \

	cd /Users/admin/Desktop/BIDS/EDSD/${i}/anat/ \

	mv -v ${i}*RAS.nii ~/Desktop/BIDS/EDSD/deriv/${i}/
	mv -v ${i}*FSL.mat ~/Desktop/BIDS/EDSD/deriv/${i}/
	mv -v ${i}*.mrx ~/Desktop/BIDS/EDSD/deriv/${i}/

done

tree ~/Desktop/BIDS/EDSD > ~/Desktop/EDSD-tree.txt

# Screenshots

cd /Users/admin/Desktop/BIDS/EDSD/deriv
for i in sub*; do
  cd /Users/admin/Desktop/BIDS/EDSD/deriv/${i}/
  mkdir ${i}_screenshot/
  freeview -v \
  ${i}_T1w_RAS.nii:grayscale=0,800 \
  --viewport sagittal \
  --layout 1 \
  --viewsize 800 800 \
  --zoom 1 \
  --screenshot /Users/admin/Desktop/BIDS/EDSD/deriv/${i}/${i}_screenshot/${i}.png

  cd /Users/admin/Desktop/BIDS/EDSD/deriv 
done

