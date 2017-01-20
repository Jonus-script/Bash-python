#Written by Jonus Joseph
#!/bin/bash
for x in `cat  /tmp/devices_list.txt`
do
#echo"==================================================="
/bin/traceroute $x >> /tmp/result_traceroute.txt  2>&1
#echo"==================================================="
done
