#!/bin/bash
# Program name: ExportLeased.sh
# Author: Tyler Nelson

serialfile='serials.txt'
leasedhostfile='hosts.txt'
serialnumbers=`cat $serialfile`
printf "\nDon't forget to delete ./hosts.txt before running this script if it already exists.\n"
printf "\nFinding all serial number matches between "
printf $serialfile
printf " and ./Computers/*.txt... Output file: "
printf $leasedhostfile
printf "...\n\n"
for serials in $serialnumbers ; do
   grep $serials ./Computers/*.txt | sed 's/.\/Computers\///g' | sed 's/\.txt:Serial Number:.........//g' >> $leasedhostfile
done
dos2unix  $leasedhostfile
printf "\n"
