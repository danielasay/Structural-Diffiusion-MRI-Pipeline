#!/bin/bash

#SBATCH --time=24:00:00   # walltime
#SBATCH --ntasks=1   # number of processor cores
#SBATCH --nodes=1   # number of nodes
#SBATCH --mem-per-cpu=16G  # memory per CPU core

# LOAD ENVIRONMENTAL VARIABLES

freesurfer

FS_BIGVENTRICLE_sub_dir=~/compute/BIDS/EDSD/deriv/${1}/${1}BIGVENTRICLE__recon_all


cd ~/compute/BIDS/EDSD/deriv


mkdir -p ~/compute/BIDS/EDSD/deriv/${1}/${1}BIGVENTRICLE__recon_all

cd ~/compute/BIDS/EDSD/deriv/${1}

recon-all \
-subjid ${1} \
-i ${1}_T1w.nii.gz \
-wsatlas \
-all \
-bigventricles \
-sd ${FS_BIGVENTRICLE_sub_dir}/


