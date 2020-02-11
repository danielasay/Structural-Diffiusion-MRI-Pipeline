#!/bin/bash



time=`date +"%Y%m%d-%H%M%S"`

mkdir -p ~/compute/BIDS/EDSD/recon_all/${time}_recon_all

cd ~/compute/BIDS/EDSD/deriv


for i in sub*; do


  sbatch \
  -o ~/compute/BIDS/EDSD/recon_all/${time}_recon_all/o-${i}.txt \
  -e ~/compute/BIDS/EDSD/recon_all/${time}_recon_all/e-${i}.txt \
  ~/compute/BIDS/EDSD/code/recon_all_job_script.sh \
  ${i}

  sleep 1

done