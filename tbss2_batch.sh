#!/bin/bash

time=`date +"%Y%m%d-%H%M%S"`


mkdir -p ~/compute/EDSD/SLURM_OUT/tbss_part2/OUT/${time}
mkdir -p ~/compute/EDSD/SLURM_OUT/tbss_part2/ERROR/${time}

sbatch \
  -o ~/compute/EDSD/SLURM_OUT/tbss_part2/OUT/${time}/output.txt \
  -e ~/compute/EDSD/SLURM_OUT/tbss_part2/ERROR/${time}/error.txt \
  ~/compute/EDSD/code/tbss_part2.sh