#!/bin/bash

#Created by Marc Niebel March 2020
#This script uses the HCV-GLUE framework to pull out reads from specified regions across the genome
#The input is a list of patient id's, the exact amino acid coordinates, size of window(in amino acids)

#$1 patient ids that you want to run in analysis
#$2 Start amino acid position
#$3 Finish amino acid position
#$4 window width
#$5 window step
#$6 depth in window

#For loop which reads in each patient id indidvidually

cat $1 | while read patient_id || [[ -n $patient_id ]];
do
        gluetools.sh --inline-cmd project hcv module thacBamUtilities invoke-function almtFilesForPatient $patient_id $2 $3 $4 $5 ps $6 mw

#Make a directory based on the id and then move all generated files into this directory
mkdir "$patient_id"
mv concatenatedBamAlmt* "$patient_id"
done

