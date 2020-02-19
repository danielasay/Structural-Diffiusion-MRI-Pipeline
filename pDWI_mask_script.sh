#!/bin/bash

#SBATCH --time=00:30:00   # walltime
#SBATCH --ntasks=1   # number of processor cores
#SBATCH --nodes=1   # number of nodes
#SBATCH --mem-per-cpu=16G  # memory per CPU core

#LOAD Variables


pWDI_path=~/compute/EDSD/deriv/pDWI/${1}


# Make pDWI Directories and Symlink Files



mkdir -p ~/compute/EDSD/deriv/pDWI/${1}

cd ~/compute/EDSD/deriv/pDWI/${1}

ln -s ~/compute/EDSD/${1}/dwi/${1}_dwi.nii.gz dwi.nii.gz
ln -s ~/compute/EDSD/${1}/dwi/${1}_dwi.bval dwi.bval
ln -s ~/compute/EDSD/${1}/dwi/${1}_dwi.bvec dwi.bvec




# Extract B0 Image

cd ${pWDI_path}

fslroi dwi.nii.gz dwi_b0.nii.gz 0 1

# Create Brain Mask

cd ${pWDI_path}

bet dwi_b0.nii.gz dwi_b0 -f 0.1 -g 0 -m -n

# Create Tree File

tree fslhome/asayd2/compute/EDSD/deriv/pDWI > ~/pWDI.txt




