#!/bin/bash

list=(*.txt)

head -1 "${list[0]}" > tmp.txt
for file in ${list[*]}
do
sed '1d;$d' $file >> tmp.txt
done

perl -pe 's/(?<!\r)\n/\r\n/g' < tmp.txt > combined.txt
rm tmp.txt
