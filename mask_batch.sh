#!/bin/bash


time=`date +"%Y%m%d-%H%M%S"`


mkdir -p ~/compute/EDSD/SLURM_OUT/pDWI/OUT/${time}
mkdir -p ~/compute/EDSD/SLURM_OUT/pDWI/ERROR/${time}

cd ~/compute/EDSD/


for i in sub*; do


  sbatch \
  -o ~/compute/EDSD/SLURM_OUT/pDWI/OUT/${time}/o-${i}.txt \
  -e ~/compute/EDSD/SLURM_OUT/pDWI/ERROR/${time}/e-${i}.txt \
  ~/compute/EDSD/code/pDWI_mask_script.sh \
  ${i}

  sleep 1

done
