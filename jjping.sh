#Written by Jonus Joseph (Tricoresolution)
#!/bin/bash
for x in `cat ip.txt`
do
#echo "##########################################################"
#ping -c 3 $x
ping -c 1 $x | awk NR==1
#echo "##########################################################"
done