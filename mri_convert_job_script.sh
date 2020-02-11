#!/bin/bash

#SBATCH --time=00:30:00   # walltime
#SBATCH --ntasks=1   # number of processor cores
#SBATCH --nodes=1   # number of nodes
#SBATCH --mem-per-cpu=16G  # memory per CPU core

# LOAD ENVIRONMENTAL VARIABLES

freesurfer


orient=~/compute/BIDS/EDSD/deriv/${1}

# CONVERT ASEG TO NIFTI

cd ${orient}/${1}_recon_all/${1}/mri/

mri_convert \
aseg.mgz \
aseg.nii.gz

#Big Ventricles MRI Convert

cd ${orient}/${1}BIGVENTRICLE__recon_all/${1}/mri

mri_convert \
aseg.mgz \
aseg.nii.gz

# EXTRACT LATERAL VENTRICLE BINARY ROI

cd ${orient}/${1}_recon_all/${1}/mri/


c3d \
aseg.nii.gz -thresh 4 4 1 0 \
aseg.nii.gz -thresh 43 43 1 0 \
-add \
-o lateralventricles.nii.gz

# Big Ventricle Extraction

cd ${orient}/${1}BIGVENTRICLE__recon_all/${1}/mri

c3d \
aseg.nii.gz -thresh 4 4 2 0 \
aseg.nii.gz -thresh 43 43 2 0 \
-add \
-o lateralventricles.nii.gz

# VIEW JUST THE LATERAL VENTRICLES

cd ${orient}

freeview \
-v ${1}_recon_all/${1}/mri/T1.mgz \
${1}_recon_all/${1}/mri/lateralventricles.nii.gz:colormap=jet:opacity=0.5:colorscale=0,2 \
${1}BIGVENTRICLE__recon_all/${1}/mri/lateralventricles.nii.gz:colormap=jet:opacity=0.5:colorscale=0,2






