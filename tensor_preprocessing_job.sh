#!/bin/bash

#SBATCH --time=00:30:00   # walltime
#SBATCH --ntasks=1   # number of processor cores
#SBATCH --nodes=1   # number of nodes
#SBATCH --mem-per-cpu=16G  # memory per CPU core


#LOAD ENVIRONMENTAL VARIABLES

tensor_dir=~/compute/EDSD/deriv/pDWI/${1}

#Generate new mask of epi corrected image, run twice for clean image

cd ${tensor_dir}

bet dwi_epi.nii.gz dwi_epi_b0 -f 0.5 -g 0 -m 
bet dwi_epi.nii.gz dwi_epi_b0 -f 0.5 -g 0 -m 

# Fit Tensors

dtifit \
--data=dwi_epi.nii.gz \
--out=dti \
--mask=dwi_epi_b0_mask.nii.gz \
--bvecs=dwi_eddy.eddy_rotated_bvecs \
--bvals=dwi.bval \
--save_tensor
