#!/usr/bin/python3.4
from mm import *

data = b'(\x80\x01\x0833\x00\t\x99\x8332'

u = uint8ary(128)
s = data.decode('utf-8', errors="surrogateescape")
memmove(u, s)
print(u)
