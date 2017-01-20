#!/usr/bin/bash
#Author : Jonus Joseph
 
usage="$(basename "$0") [-h] [-b] -- program to take backup of DB

where:
    -h  show help text
    -b  Use start-backup String as an argument
Example:
     $(basename "$0") -b start-backup"

function start_backup
{
/usr/bin/mysqldump -u root -pnagiosxi employees > /root/jonus/employees-dump.$(date +"%Y%m%d_%T").sql

if [ "$?" -eq 0 ]
then
/usr/bin/scp /root/jonus/employees-dump*.sql root@192.168.122.68:/root/DB_dump
   if [ "$?" -eq 0 ]
   then
   echo "Nagios DB Dump successfully copy/transfer on remote server for restore"
   else
   echo "Nagios DB Dump unable to copy/transfer on remote server for restore" #| mail -s "Nagios DB backup faile
d" jonusjoseph@gmail.com
   fi
else
echo "Unable to dump the Nagios DB on Nagios Server" #| mail -s "Nagios DB backup failed" jonusjoseph@gmail.com
fi


/usr/bin/rm -f /root/jonus/employees-dump*.sql

#Login on remote server for DB restore

/usr/bin/ssh root@192.168.122.68

x=`/usr/bin/ls -lt /root/DB_dump/ | /usr/bin/head -2 | /usr/bin/tail -1 |/usr/bin/awk '{print $9}'`

/usr/bin/mysql -u root -pchrist -h localhost employees < /root/DB_dump/"$x"

if [ "$?" -eq 0 ]
then
  /usr/bin/find /root/DB_dump/ -name employees-dump\*.sql -type f -mmin +30 -delete
else
  echo "Unable to restore DB backup in remote server Database" #| mail -s "Nagios DB backup failed" jonusjoseph@gmail.com
fi   

exit

}

while getopts ':hb:' option; do
  case "$option" in
    h) echo "$usage"
       exit
       ;;
    b) start_backup=$OPTARG
       if [ "$start_backup" = "start-backup" ]
then
    start_backup
else
    echo "Invalid Argument $usage"
fi
       ;;
    *) echo "$usage"
       exit
       ;;
  esac
done
shift $((OPTIND - 1))
