#!/bin/bash



time=`date +"%Y%m%d-%H%M%S"`

mkdir -p ~/compute/BIDS/EDSD/pT1/${time}_t1

cd ~/compute/BIDS/EDSD/deriv


for i in sub*; do


  sbatch \
  -o ~/compute/BIDS/EDSD/pT1/${time}_t1/o-${i}.txt \
  -e ~/compute/BIDS/EDSD/pT1/${time}_t1/e-${i}.txt \
  ~/compute/BIDS/EDSD/code/T1_preprocessing_job_script.sh \
  ${i}
  sleep 1

done

# Code to source the batch script

#sbatch T1_preprocessing_job_script.sh
