#!/bin/bash
#Written by Jonus Joseph
CPU_CALL()
{
echo "Number of CPUs:" `grep processor /proc/cpuinfo | wc -l`;egrep -w  'processor|name' /proc/cpuinfo
}

MEMORY_CALL()
{
echo "Memory Size :  `free -g | grep -i 'Mem' | awk '{print $2}'` GB"
}



if [ "$1" == "cpu" ]
then
  CPU_CALL
elif [ "$1" == "memory" ]
then
  MEMORY_CALL
else
  echo "Wrong Argument"
  exit 1
fi


