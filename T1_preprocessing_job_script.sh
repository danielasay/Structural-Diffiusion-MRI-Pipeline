#!/bin/bash

#SBATCH --time=00:15:00   # walltime
#SBATCH --ntasks=1   # number of processor cores
#SBATCH --nodes=1   # number of nodes
#SBATCH --mem-per-cpu=12G  # memory per CPU core

# LOAD ENVIRONMENTAL VARIABLES


#Crop

cd /fslhome/asayd2/compute/BIDS/EDSD/deriv

for i in sub*; do

cd /fslhome/asayd2/compute/BIDS/EDSD/deriv/${i}


c3d \
${i}_T1w_RAS.nii \
-trim 20vox \
-o ${i}_cropped.nii.gz


# N4 BIAS FIELD CORRECTION

cd /fslhome/asayd2/compute/BIDS/EDSD/deriv/${i}


N4BiasFieldCorrection \
-v -d 3 \
-i  ${i}_cropped.nii.gz \
-o ${i}_n4.nii.gz \
-s 4 -b [200] -c [50x50x50x50,0.000001]


# RESAMPLE

cd /fslhome/asayd2/compute/BIDS/EDSD/deriv/${i}


c3d \
${i}_n4.nii.gz \
-resample-mm 1x1x1mm \
-o ${i}_T1w.nii.gz


#Clean up Directory

cd /fslhome/asayd2/compute/BIDS/EDSD/deriv/${i}


rm ${i}_cropped.nii.gz
rm ${i}_n4.nii.gz



done


# Code to source the batch script

#source T1_batch_script.sh

