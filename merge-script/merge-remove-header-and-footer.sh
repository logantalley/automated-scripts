list=(*.txt)

head -1 "${list[0]}" > tmp.txt
sed '1d;$d' "${list[@]}" >> tmp.txt
echo "FOOTER" >> tmp.txt
perl -pe 's/(?<!\r)\n/\r\n/g' < tmp.txt > combined.txt
rm tmp.txt
