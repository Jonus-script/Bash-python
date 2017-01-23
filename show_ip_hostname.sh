#Written By Jonus Joseph
#shell script to show IP with Hostname using ping command
#[root@localhost tmp]$ sh test.sh ip.txt
#!/bin/bash
FILENAME=$1
count=0

while read LINE

do

let count++

ping -c 1 $LINE | awk '{print $2 $3}'|awk 'NR==1'
#echo "$count $LINE"
done < $FILENAME

echo -e "\nTotal $count Lines read"
