#!/bin/bash

#SBATCH --time=00:15:00   # walltime
#SBATCH --ntasks=1   # number of processor cores
#SBATCH --nodes=1   # number of nodes
#SBATCH --mem-per-cpu=16G  # memory per CPU core

# LOAD ENVIRONMENTAL VARIABLES

freesurfer

#Crop


cd /fslhome/asayd2/compute/BIDS/EDSD/deriv/${1}


c3d \
${1}_T1w_RAS.nii \
-trim 20vox \
-o ${1}_cropped.nii.gz


# N4 BIAS FIELD CORRECTION


N4BiasFieldCorrection \
-v -d 3 \
-i  ${1}_cropped.nii.gz \
-o ${1}_n4.nii.gz \
-s 4 -b [200] -c [50x50x50x50,0.000001]


# RESAMPLE


c3d \
${1}_n4.nii.gz \
-resample-mm 1x1x1mm \
-o ${1}_T1w.nii.gz


#Clean up Directory


rm ${1}_cropped.nii.gz
rm ${1}_n4.nii.gz