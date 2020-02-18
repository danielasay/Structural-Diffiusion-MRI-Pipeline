#!/bin/bash

time=`date +"%Y%m%d-%H%M%S"`


mkdir -p ~/compute/EDSD/SLURM_OUT/mri_convert/OUT/${time}
mkdir -p ~/compute/EDSD/SLURM_OUT/mri_convert/ERROR/${time}

cd ~/compute/EDSD/deriv/freesurfer_subs


for i in sub*; do


  sbatch \
  -o ~/compute/EDSD/SLURM_OUT/mri_convert/OUT/${time}/o-${i}.txt \
  -e ~/compute/EDSD/SLURM_OUT/mri_convert/ERROR/${time}/e-${i}.txt \
  ~/compute/EDSD/code/mri_convert_job_script.sh \
  ${i}

  sleep 1

done