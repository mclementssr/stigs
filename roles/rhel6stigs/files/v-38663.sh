#!/bin/bash

rm -f /tmp/testfile.txt
rm -f /tmp/testfile2.txt
rm -f /tmp/testfile3.txt
rm -f /tmp/testfile4.txt
rpm -Va | grep '^.M' >> /tmp/testfile.txt
#Removes the first column.
awk '{print $2}' /tmp/testfile.txt >> /tmp/testfile2.txt
while read in; do rpm -qf "$in";  done < /tmp/testfile2.txt >> /tmp/testfile3.txt
#Removes all duplicated lines.
sed '$!N; /^\(.*\)\n\1$/!P; D' /tmp/testfile3.txt >> /tmp/testfile4.txt
#Deletes filesystem for /tmp/testfile4.txt
sed --in-place '/filesystem/d' /tmp/testfile4.txt
while read in; do rpm --setperms "$in"; done < /tmp/testfile4.txt
while read in; do rpm --setugids "$in"; done < /tmp/testfile4.txt
rm -f /tmp/testfile.txt
rm -f /tmp/testfile2.txt
rm -f /tmp/testfile3.txt
rm -f /tmp/testfile4.txt

