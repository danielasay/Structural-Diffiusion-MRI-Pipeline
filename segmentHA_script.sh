#!/bin/bash

#SBATCH --time=03:00:00   # walltime
#SBATCH --ntasks=4   # number of processor cores
#SBATCH --nodes=1   # number of nodes
#SBATCH --mem-per-cpu=16G  # memory per CPU core


#LOAD ENVIRONMENTAL VARIABLES

export FREESURFER_HOME=~/research_bin/freesurfer-dev/freesurfer && source $FREESURFER_HOME/SetUpFreeSurfer.sh


cd ~/compute/EDSD/deriv/freesurfer_subs/${1}

segmentHA_T1.sh \
${1} \
${SUBJECTS_DIR}/freesurfer_subs/