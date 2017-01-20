#!/bin/bash
#title           :nagios_port_check.sh
#description     :This script will check remote server port connectivity using TCP protocol

SERVER=$2
PORT=$1
DESC=$3
usage="$(basename "$0")

where:
    -h  show help text
 Example:
     $(basename "$0") <port number> <IP / Hostname> <discription>"


function port_checking
{
#</dev/tcp/$SERVER/$PORT
timeout 1 bash -c cat < /dev/null > /dev/tcp/$SERVER/$PORT
if [ "$?" -ne 0 ]; then
  echo "Problem :Connection to $DESC server $SERVER on port $PORT failed"
  exit 1
else
  echo "OK :Connection to $DESC $SERVER on port $PORT succeeded"
  exit 0
fi
}

if [ "$1" == "--help" ]; then
    echo "$0: $usage"
    exit 1
else
port_checking
fi
