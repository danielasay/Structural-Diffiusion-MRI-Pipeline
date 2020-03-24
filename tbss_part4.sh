#!/bin/bash

#SBATCH --time=30:00:00   # walltime
#SBATCH --ntasks=1   # number of processor cores
#SBATCH --nodes=1   # number of nodes
#SBATCH --mem-per-cpu=16G  # memory per CPU core

#Load Environmental Variables

tbss_path=~/compute/EDSD/deriv/tbss

cd ${tbss_path}

tbss_4_prestats -0.049