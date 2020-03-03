#!/bin/bash

#!/bin/bash

#SBATCH --time=03:00:00   # walltime
#SBATCH --ntasks=4   # number of processor cores
#SBATCH --nodes=1   # number of nodes
#SBATCH --mem-per-cpu=16G  # memory per CPU core


#LOAD ENVIRONMENTAL VARIABLES

eddy_path=~/compute/EDSD/deriv/pDWI/${1}

T1_path=~/compute/EDSD/deriv/freesurfer_subs/${1}/mri

freesurfer


#Create new Eddy BO image and mask

cd ${eddy_path}


bet dwi_eddy.nii.gz tmp -f 0.3 -g 0 -m
bet tmp.nii.gz dwi_eddy_b0 -f 0.3 -g 0 -m
rm tmp*

# Skull Strip T1

mri_convert ${T1_path}/brainmask.mgz t1.nii.gz

# Align New Mask with T1

antsRegistrationSyNQuick.sh \
-d 3 \
-f dwi_eddy_b0.nii.gz \
-m t1.nii.gz \
-o T1toEddyB0_ \
-t a

# Fix Distortions

antsRegistrationSyN.sh \
-d 3 \
-f T1toEddyB0_Warped.nii.gz \
-m dwi_eddy_b0.nii.gz \
-o dwi_epi \
-t so


# Apply Transformation to Eddy Corrected Image

antsApplyTransforms \
--dimensionality 3 \
--input-image-type 3 \
--input dwi_eddy.nii.gz \
--output dwi_epi.nii.gz \
--reference-image T1toEddyB0_Warped.nii.gz \
--interpolation Bspline \
--transform dwi_epi_1InverseWarp.nii.gz








