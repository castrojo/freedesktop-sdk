#!/usr/bin/python3
import sys
from socket import gethostbyname

host = sys.argv[1]

with open("/etc/hosts", "a", encoding="utf-8") as file:
    print(gethostbyname(host) + " " + host, file=file)
