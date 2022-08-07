#!/usr/bin/python3
from socket import gethostbyname
import sys

host = sys.argv[1]

with open("/etc/hosts", "a", encoding="utf-8") as file:
    print(gethostbyname(host) + " " + host, file=file)
