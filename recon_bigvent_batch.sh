#!/bin/bash



time=`date +"%Y%m%d-%H%M%S"`

mkdir -p ~/compute/EDSD/SLURM_OUT/recon_all_bigvent/OUT/${time}

mkdir -p ~/compute/EDSD/SLURM_OUT/recon_all_bigvent/ERROR/${time}


cd ~/compute/EDSD/deriv/freesurfer_subs_bigvent


for i in sub*; do


  sbatch \
  -o ~/compute/EDSD/SLURM_OUT/recon_all_bigvent/OUT/${time}/o-${i}.txt \
  -e ~/compute/EDSD/SLURM_OUT/recon_all_bigvent/ERROR/${time}/e-${i}.txt \
  ~/compute/EDSD/code/recon_bigvent_script.sh \
  ${i}
  sleep 1

done