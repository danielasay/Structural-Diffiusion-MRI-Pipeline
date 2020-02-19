#!/bin/bash


cd ~/compute/EDSD/deriv/pDWI

for i in sub*; do

bvalCount=`c4d ~/compute/EDSD/deriv/pDWI/${i}/dwi.nii.gz -info-full | grep -Ewo "dim\[4\] = [0-9]{1,3}" | cut -d = -f2`
bvecCount=`c4d ~/compute/EDSD/deriv/pDWI/${i}/dwi.nii.gz -info-full | grep -Ewo "dim\[3\] = [0-9]{1,3}" | cut -d = -f2`
totalvol=`c4d ~/compute/EDSD/deriv/pDWI/${i}/dwi.nii.gz -info-full | grep -Ewo "dim\[2\] = [0-9]{1,3}" | cut -d = -f2`

echo "$i, $bvalCount, $bvecCount, $totalvol" >> b_values.csv
done