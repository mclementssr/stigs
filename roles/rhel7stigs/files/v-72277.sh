#!/bin/bash

rm -f /tmp/testfile.txt
find / -name '*.shosts' >> /tmp/testfile.txt
while read in; do rm -f "$in"; done < /tmp/testfile.txt
rm -f /tmp/testfile.txt

