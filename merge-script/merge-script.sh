#!/bin/bash
OPTIND=1
FORMAT=txt
FILENAME=combined.txt
CONVERSION_TYPE=''
while getopts "d:e:f:t:h" opt; do
	case "$opt" in
	d) DIR=$OPTARG
	;;
	e) FORMAT=$OPTARG
	;;
	f) FILENAME=$OPTARG
	;;
	t) CONVERSION_TYPE=$OPTARG
	;;
	h) printf "Usage: %s: \n [-d directory] \n [-e file extension] \n [-f specify name of combined file] \n [-t conversion type: \n 'ho': headers only \n 'hf': header and footer \n 'e': remove headers and footers entirely (no preservation)\n 'n': no headers or footers exist]  \n" $0
	exit 2;;
	esac
done
shift $((OPTIND-1))
[ "${1:-}" = "--" ] && shift
cd $DIR

# add all txt files to array
list=(*.$FORMAT)



#### PRESERVE HEADER ONLY ####
if [ "$CONVERSION_TYPE" == "ho" ]
then

# add header to temporary file
head -1 "${list[0]}" > tmp.txt

# remove header from remaining files
for file in ${list[*]}
do
tail -n +2 $file >> tmp.txt
done
########################################


#### PRESERVE HEADER AND FOOTER #####
elif [ "$CONVERSION_TYPE" == "hf" ]
then
head -1 "${list[0]}" > tmp.txt
for file in ${list[*]}
do
sed '1d;$d' $file >> tmp.txt
done
echo "footer" >> tmp.txt
########################################


#### REMOVE HEADERS AND FOOTERS ENTIRELY ####
elif [ "$CONVERSION_TYPE" == "e" ]
then
for file in ${list[*]}
do
sed '1d;$d' $file >> tmp.txt
done
########################################


#### NO HEADERS OR FOOTERS EXISTS ####
elif [ "$CONVERSION_TYPE" == "n" ]
then
cat $list > tmp.txt
########################################

else
echo "please run the command again with -t. run with -h for a list of possibilities"
exit
fi

# remove those pesky carriage returns
perl -pe 's/(?<!\r)\n/\r\n/g' < tmp.txt > $FILENAME

rm tmp.txt
