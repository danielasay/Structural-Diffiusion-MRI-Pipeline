#!/bin/bash

# DCM2NIIX for T1 images and DWI Images

cd /fslhome/asayd2/compute/EDSD

for i in sub*; do 

mkdir ${i}/anat

dcm2niix \
  -o ${i}/anat/ \
  -x n \
  -f ${i}_T1w \
  -z n \
  ${i}/DICOM/mprage

 mkdir ${i}/dwi

dcm2niix \
	-o ${i}/dwi \
	-f ${i}_dwi \
	-z y \
	${i}/DICOM/diff

done