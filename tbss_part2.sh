#!/bin/bash

#SBATCH --time=30:00:00   # walltime
#SBATCH --ntasks=8   # number of processor cores
#SBATCH --nodes=1   # number of nodes
#SBATCH --mem-per-cpu=16G  # memory per CPU core

#Load Environmental Variables

tbss_path=~/compute/EDSD/deriv/tbss

cd ${tbss_path}

tbss_2_reg -t ~/templates/ENIGMA/ENIGMA_DTI_FA.nii.gz