#!/bin/bash

#SBATCH --time=08:00:00   # walltime
#SBATCH --ntasks=4   # number of processor cores
#SBATCH --nodes=1   # number of nodes
#SBATCH --mem-per-cpu=16G  # memory per CPU core


#LOAD ENVIRONMENTAL VARIABLES

path=~/compute/EDSD/deriv/pDWI/${1}


bval=`cat ${path}/dwi.bval | wc -w`
indx=""


#Create index and acqparams files


cd ~/compute/EDSD/deriv/pDWI/${1}


printf "0 -1 0 0.072" > acqparams.txt


for ((i=1; i<=${bval}; i+=1)); do indx="$indx 1"; done


echo $indx > index.txt

# Run Eddy Correct


eddy_openmp \
--imain=dwi.nii.gz \
--acqp=acqparams.txt \
--index=index.txt \
--mask=dwi_mask_cleaned.nii.gz \
--bvecs=dwi.bvec \
--bvals=dwi.bval \
--out=dwi_eddy \
--verbose





