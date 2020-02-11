#!/bin/bash


# Use Freeview Locally

cd ~/Desktop/BIDS/EDSD/deriv


for i in sub*; do

cd ~/Desktop/BIDS/EDSD/deriv


freeview \
-v ${i}/${i}_recon_all/${i}/mri/T1.mgz \
${i}/${i}_recon_all/${i}/mri/lateralventricles.nii.gz:colormap=jet:opacity=0.5:colorscale=0,2 \
${i}/${i}BIGVENTRICLE__recon_all/${i}/mri/lateralventricles.nii.gz:colormap=jet:opacity=0.5:colorscale=0,2


done