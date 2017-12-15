#!/bin/bash

rm -f /tmp/testfile.txt
rm -f /tmp/testfile2.txt
rm -f /tmp/testfile3.txt
rm -f /tmp/testfile4.txt
rm -f /tmp/testfile5.txt
rpm -Va | grep '^..5' >> /tmp/testfile.txt
#Deletes any line with "c" in the third column.
awk '$2 != "c"' /tmp/testfile.txt > /tmp/testfile2.txt
#Removes the first and second columns.
awk '{print $2}' /tmp/testfile2.txt >> /tmp/testfile3.txt
while read in; do rpm -qf "$in";  done < /tmp/testfile3.txt >> /tmp/testfile4.txt
#Removes all duplicated lines.
sed '$!N; /^\(.*\)\n\1$/!P; D' /tmp/testfile4.txt >> /tmp/testfile5.txt
#Removes line with filesystem in it.
sed --in-place '/filesystem/d' /tmp/testfile5.txt
#while read in; do rpm --setperms "$in"; done < /tmp/testfile5.txt
#while read in; do rpm --setugids "$in"; done < /tmp/testfile5.txt
rm -f /tmp/testfile.txt
rm -f /tmp/testfile2.txt
rm -f /tmp/testfile3.txt
rm -f /tmp/testfile4.txt
rm -f /tmp/testfile5.txt
