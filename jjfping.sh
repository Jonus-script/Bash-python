#Written by Jonus Joseph
#!/bin/bash
for x in `cat ip.txt`
do
#echo "##########################################################"
#ping -c 3 $x
fping $x #| awk NR==1
#echo "##########################################################"
done
