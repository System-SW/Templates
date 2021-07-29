#!/bin/bash
# _Gen_CDF_comparisone.sh Created by Seongjin Lee
# ESOS Lab. Hanyang University
# 2013-01-22

if [[ -z "$1" || -z "$2" || -z "$3" || -z "$4" || -z "$5" || -z "$6" ]]
then 
     echo $0: usage $0 DATA_FILE_NAME_1 DATA_FILE_NAME_1 GRAPH_TITLE XLABEL_NAME KEY1 KEY2
     echo "Example: $0 SOME_SERIES_1.data SOME_SERIES_2.data \"CDF of Latency\" \"Sequence of Series\" \"DIO\" \"SIO\""
     exit 3
fi 

if test -f "temp_cdf.GP" ; then
    rm "temp_cdf.GP"
fi

# Counts number of tuples in the series
max_val_1=`awk 'END{ print NR}' ${1}`; 
max_val_2=`awk 'END{ print NR}' ${2}`; 


# If there is a field descriptor in first line sed 1d deletes the line
# Creates a temporary file to store frequency data
sed '1d' ${1} | awk '
{ DATA[$2]++; }
END{ for ( counter in DATA )
print counter"\t"DATA[counter]
}' | sort -k 1,1n  > temp_freq_file_1
sed '1d' ${2} | awk '
{ DATA[$2]++; }
END{ for ( counter in DATA )
print counter"\t"DATA[counter]
}' | sort -k 1,1n  > temp_freq_file_2


# It makes sure cdf starts from 0
# Calculates cumulative sum and devides by total number of tuples
awk -v num="${max_val_1}" 'BEGIN{print 0"\t"0}{ acc+=$2; printf "%6.7f\t%6.5f\n",$1*1000, (acc/num)*100} ' temp_freq_file_1 > temp_cdf_file_1
awk -v num="${max_val_2}" 'BEGIN{print 0"\t"0}{ acc+=$2; printf "%6.7f\t%6.5f\n",$1*1000, (acc/num)*100} ' temp_freq_file_2 > temp_cdf_file_2

Xrange1=`sed '$!d' temp_cdf_file_1 | awk 'END{printf "%f", $1}'`
Xrange2=`sed '$!d' temp_cdf_file_2 | awk 'END{printf "%f", $1}'`
if [  `echo ${Xrange1} | awk '{print int($1*100000)}'` -ge `echo ${Xrange2} | awk '{print int($1*100000)}'` ]
then
     Xrange=`echo ${Xrange1}`
else
     Xrange=`echo ${Xrange2}`
fi

#STEPS=`sed '$!d' temp_cdf | awk 'END{printf "%.3f", $1/10}'`

BASE=`echo $1| awk -F"." '{print $2}'`

echo "
reset
EPSFILE=\"${1%.$BASE}.eps\"
DATAFILE1=\"temp_cdf_file_1\"
DATAFILE2=\"temp_cdf_file_2\"
MAX_XRANGE=${Xrange}
GRAPHTITLE=\"${3}\"
XLABEL=\"${4}\"
KEY1=\"${5}\"
KEY2=\"${6}\"
load \"CDF_comparison.template\"

" >> "temp_cdf.GP"

gnuplot "temp_cdf.GP"


rm temp_*

