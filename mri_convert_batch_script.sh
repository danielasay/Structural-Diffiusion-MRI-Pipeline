#!/bin/bash

time=`date +"%Y%m%d-%H%M%S"`


mkdir -p ~/compute/BIDS/EDSD/mri_convert/${time}_mri_convert

cd ~/compute/BIDS/EDSD/deriv


for i in sub*; do


  sbatch \
  -o ~/compute/BIDS/EDSD/mri_convert/${time}_mri_convert/o-${i}.txt \
  -e ~/compute/BIDS/EDSD/mri_convert/${time}_mri_convert/e-${i}.txt \
  ~/compute/BIDS/EDSD/code/mri_convert_job_script.sh \
  ${i}

  sleep 1

done