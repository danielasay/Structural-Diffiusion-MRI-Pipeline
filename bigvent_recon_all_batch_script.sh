#!/bin/bash



time=`date +"%Y%m%d-%H%M%S"`

mkdir -p ~/compute/BIDS/EDSD/recon_all/${time}_BIGVENTRICLE_recon_all

cd ~/compute/BIDS/EDSD/deriv


for i in sub*; do

cd ~/compute/BIDS/EDSD/deriv

  sbatch \
  -o ~/compute/BIDS/EDSD/recon_all/${time}_BIGVENTRICLE_recon_all/o-${i}.txt \
  -e ~/compute/BIDS/EDSD/recon_all/${time}_BIGVENTRICLE_recon_all/e-${i}.txt \
  ~/compute/BIDS/EDSD/code/bigvent_recon_all_job_script.sh \
  ${i}

  sleep 1

done