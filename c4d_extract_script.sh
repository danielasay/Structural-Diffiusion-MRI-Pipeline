#!/bin/bash


cd ~/compute/EDSD/deriv/pDWI

for i in sub*; do

niftiCount=`c4d ~/compute/EDSD/deriv/pDWI/${i}/dwi.nii.gz -info-full | grep -Ewo "dim\[4\] = [0-9]{1,3}" | cut -d = -f2`
bvalCount=`cat ~/compute/EDSD/deriv/pDWI/${i}/dwi.bval | wc -w`
bvecCount=`head ~/compute/EDSD/deriv/pDWI/${i}/dwi.bvec | wc -w`

echo "$i, $bvalCount, $bvecCount, $niftiCount" >> b_values.csv
done
