#!/bin/python
# Author : Jonus Joseph
# Discription : This script is responsible for Linux server individual service monitoring.
import commands
import sys
import argparse


def service_help():
        parser = argparse.ArgumentParser(description='check service')
        parser.add_argument('string',metavar='--service',type=str,nargs='+')
        return parser.parse_args()

def main():

        first_arg=str(sys.argv[1])
        if first_arg == "--help" or first_arg == "-h":
                print service_help()
        else:
                x=sys.argv[2]
                outb = "/bin/systemctl status %s | awk 'NR==3' | awk '{print $3}'| cut -f 2-7" % x
                outa = "/bin/systemctl status %s | awk 'NR==3' | awk '{print $2}'" % x
                cmpb = commands.getoutput(outb)
                cmpa = commands.getoutput(outa)
                #print cmpb
        if cmpb == "(running)" : #and cmpa == "active":
                print "OK: %s service is running" % x
                sys.exit(0)
        else:
                print "Problem : %s service is not running" % x
                sys.exit(2)


if __name__ == "__main__":
    main()
