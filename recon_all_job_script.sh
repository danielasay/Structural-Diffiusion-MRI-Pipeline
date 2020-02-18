#!/bin/bash

#SBATCH --time=24:00:00   # walltime
#SBATCH --ntasks=4   # number of processor cores
#SBATCH --nodes=4   # number of nodes
#SBATCH --mem-per-cpu=16G  # memory per CPU core

# LOAD ENVIRONMENTAL VARIABLES

freesurfer

FS_sub_dir=~/compute/BIDS/EDSD/deriv/freesurfer_subs/${1}


cd ~/compute/BIDS/EDSD/deriv/pT1/${1}

recon-all \
-subjid ${1} \
-i ${1}_T1w.nii.gz \
-wsatlas \
-all \
-sd ${FS_sub_dir}/

