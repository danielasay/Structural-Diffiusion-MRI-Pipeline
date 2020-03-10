#!/bin/bash

time=`date +"%Y%m%d-%H%M%S"`


mkdir -p ~/compute/EDSD/SLURM_OUT/tensor_align/OUT/${time}
mkdir -p ~/compute/EDSD/SLURM_OUT/tensor_align/ERROR/${time}

cd ~/compute/EDSD/deriv/pDWI


for i in sub*; do


  sbatch \
  -o ~/compute/EDSD/SLURM_OUT/tensor_align/OUT/${time}/o-${i}.txt \
  -e ~/compute/EDSD/SLURM_OUT/tensor_align/ERROR/${time}/e-${i}.txt \
  ~/compute/EDSD/code/tensor_preprocessing_job.sh \
  ${i}

  sleep 1

done
