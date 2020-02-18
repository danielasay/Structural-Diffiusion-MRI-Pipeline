#!/bin/bash



time=`date +"%Y%m%d-%H%M%S"`

mkdir -p ~/compute/EDSD/SLURM_OUT/recon_all/OUT/${time}

mkdir -p ~/compute/EDSD/SLURM_OUT/recon_all/ERROR/${time}


cd ~/compute/EDSD/deriv/freesurfer_subs


for i in sub*; do


  sbatch \
  -o ~/compute/EDSD/SLURM_OUT/recon_all/OUT/${time}/o-${i}.txt \
  -e ~/compute/EDSD/SLURM_OUT/recon_all/ERROR/${time}/e-${i}.txt \
  ~/compute/EDSD/code/recon_all_job_script.sh \
  ${i}
  sleep 1

done