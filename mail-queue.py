#!/bin/python
# Author : Jonus Joseph
import commands
import sys
import time
import argparse

def mail_q_help ():
    parser = argparse.ArgumentParser(description='checking mailq')
    parser.add_argument('string',
                        metavar='--mailq',
                        type=str,
                        nargs='+')
    return parser.parse_args()


def main():

        first_arg=str(sys.argv[1])
        if first_arg == "--help" or first_arg == "-h":
                print mail_q_help()
        else:

                outb = commands.getoutput("/bin/mailq | grep -v 'Mail queue is empty' | wc -l")
                time.sleep(300)
#print outb
                outa = commands.getoutput("/bin/mailq | grep -v 'Mail queue is empty' | wc -l")
#print outa

                outb = int (outb)
                outa = int (outa)


        if outb > 0 and outa > 0:
                print "Problem : emails are stucking in mail queue"
                sys.exit(2)
        else:
                print "OK : mails are not stucking in mail queue"
                sys.exit(0)

if __name__ == "__main__":
    main()
