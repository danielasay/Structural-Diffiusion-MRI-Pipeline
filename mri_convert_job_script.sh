#!/bin/bash

#SBATCH --time=00:30:00   # walltime
#SBATCH --ntasks=1   # number of processor cores
#SBATCH --nodes=1   # number of nodes
#SBATCH --mem-per-cpu=16G  # memory per CPU core

# LOAD ENVIRONMENTAL VARIABLES

freesurfer


orient_reg=~/compute/EDSD/deriv/freesurfer_subs/${1}/mri
orient_big=~/compute/EDSD/deriv/freesurfer_subs_bigvent/${1}/mri

# CONVERT ASEG TO NIFTI

cd ${orient_reg}

mri_convert \
aseg.mgz \
aseg.nii.gz

#Big Ventricles MRI Convert

cd ${orient_big}

mri_convert \
aseg.mgz \
aseg.nii.gz

# EXTRACT LATERAL VENTRICLE BINARY ROI

cd ${orient_reg}


c3d \
aseg.nii.gz -thresh 4 4 1 0 \
aseg.nii.gz -thresh 43 43 1 0 \
-add \
-o lateralventricles.nii.gz

# Big Ventricle Extraction

cd ${orient_big}

c3d \
aseg.nii.gz -thresh 4 4 2 0 \
aseg.nii.gz -thresh 43 43 2 0 \
-add \
-o lateralventricles.nii.gz

#VIEW JUST THE LATERAL VENTRICLES


freeview \
-v ${orient_reg}/T1.mgz \
${orient_reg}/mri/lateralventricles.nii.gz:colormap=jet:opacity=0.5:colorscale=0,2 \
${orient_big}/mri/lateralventricles.nii.gz:colormap=jet:opacity=0.5:colorscale=0,2






