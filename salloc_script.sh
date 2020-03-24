#!/bin/bash

salloc  --mem-per-cpu=16G --nodes=1 --ntasks=1 --time='06:00:00'

cd ~/compute/EDSD

for i in sub*; do

cd ~/compute/EDSD/deriv/tbss

  # COPY NORMALIZED IMAGE FILE TO INDIVIDUAL DIRECTORY
  mkdir -p ./FA-individ/${i}/stats/
  mkdir -p ./FA-individ/${i}/FA/
  cp -v ./FA/${i}_*.nii.gz ./FA-individ/${i}/FA/
  
  # SKULL STRIP / BRAIN EXTRACT
  fslmaths \
  ./FA-individ/${i}/FA/${i}_*FA_to_target.nii.gz \
  -mas ./stats/mean_FA_mask.nii.gz \
  ./FA-individ/${i}/FA/${i}_masked_FA.nii.gz
  
  # SKELETONIZE
  tbss_skeleton \
  -i ./FA-individ/${i}/FA/${i}_masked_FA.nii.gz \
  -p 0.049 \
  ./stats/mean_FA_skeleton_mask_dst \
  ~/research_bin/FSL/data/standard/LowerCingulum_1mm.nii.gz \
  ./FA-individ/${i}/FA/${i}_masked_FA.nii.gz \
  ./FA-individ/${i}/stats/${i}_masked_FAskel.nii.gz \
  -s ./stats/mean_FA_skeleton_mask.nii.gz
done