#!/bin/bash


time=`date +"%Y%m%d-%H%M%S"`


mkdir -p ~/compute/EDSD/SLURM_OUT/eddy_correct/OUT/${time}
mkdir -p ~/compute/EDSD/SLURM_OUT/eddy_correct/ERROR/${time}

cd ~/compute/EDSD/deriv/pDWI


for i in sub*; do


  sbatch \
  -o ~/compute/EDSD/SLURM_OUT/eddy_correct/OUT/${time}/o-${i}.txt \
  -e ~/compute/EDSD/SLURM_OUT/eddy_correct/ERROR/${time}/e-${i}.txt \
  ~/compute/EDSD/code/eddy_correct_job.sh \
  ${i}

  sleep 1

done
