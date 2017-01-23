#!/bin/bash
#how to add service check in Nagios using bash script:

usage() {
echo "Usage: $0 [-h <hostname>] [-c <clientname>] [-i <IP address>] [-t <template name>]" 1>&2; exit 1;
echo " Example : ./$0 -h psmlosiastap01 -c Astellas -i 10.176.70.5 -t somastlindev" 1>&2; exit 1;
}


while getopts ":h:c:i:t:" o; do
    case "${o}" in
        h)
            h=${OPTARG}
            ;;
        c)
            c=${OPTARG}
            ;;
        i)
            i=${OPTARG}
            ;;
        t)
            t=${OPTARG}
            ;;
        *)
           usage
           ;;

    esac
done
shift $((OPTIND-1))

if [ -z "${h}" ] || [ -z "${c}" ] || [ -z "${i}" ] || [ -z "${t}" ]; then
    usage
fi


HNAME=${h}
CNAME=${c}
IP=${i}
TEMPLATE=${t}


echo "define host{" >> jonus.txt
echo "use                     $TEMPLATE" >> jonus.txt
echo "host_name               $CNAME-$HNAME" >> jonus.txt
echo "alias                   $HNAME.$CNAME.com" >> jonus.txt
echo "address                 $IP" >> jonus.txt
echo "}" >> jonus.txt
