#Written by Jonus Joseph
#!/bin/bash
for x in `cat ip.txt`
do
#echo"==================================================="
date;telnet $x 10050 2>&1;date
#echo"==================================================="
done
