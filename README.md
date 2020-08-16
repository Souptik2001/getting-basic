# Let's Start small

Let's start with a simple C code 👇

```c
#include <stdio.h>

int main(int argc, char *argv[]) {
        printf("Hello World\n");
        return 0;
}
```

So, to run this code we need a compiler which converts the plain text to a program.
We can use a mordern compiler like GCC 👇

```bash
gcc filename.c -o outputname -Wall
```

'-Wall' is actually needed to detect if any warnings are there or not.
After this you get a executable file. So, now you can execute the file as 👇

```bash
./outputname
```

## Avoiding the annoying path

So, here you see that you have to provide the path of the program in the bash. So, that can be avoe=ided if you put the path of this program in the PATH environment variable.
That can be easily done like 👇

```bash
export PATH=$PATH:/yourpath
```

Remember to always give the absolute path.
Now you can acess you executable program from anywhre just using the name of you program just like inbuild commands like 'ls',  etc.

## Arguments

'argc' is actually the argument count and the 'argv' is the vector or array of the arguments.
To understand this in greater detail you might want to understand that how arguments are passed from the shell to the program.
Actually all the space seperated words are one argument starting from the promt. So, if you have four space-seperated words, then you have four arguments.
Example 👇

***prompt $*** outputname arg2 arg3
                arg[0]   arg[1] arg[2]

If you want two to place a space between two words but want to get them as only one arg then you have to use "" like 👇

Lets modify the program a bit 👇

```c
#include <stdio.h>

int main(int argc, char *argv[]) {
    if(argc==2){
        printf("Hello %s\n", argv[1]);
    }else{
        fprintf(stderr, "Usage %s <name>\n", argv[0]);
        return 1;
    }
    return 0;
}
```

And now let's run it 👇

```bash
outputname "My Name"
```

And we should get output like this 👇

```bash
Hello My Name
```

A quick interesting thing 😎🌟

If you place the execution command of the program in the .bashrc file (which is in the home folder) then whenever you open a terminal you will see that program running and using that you can do anything like greet yourself or any anymation or ....anything.....

## Python

Next let's take a mordern language like Python 🐍

So, let's take some time to understand python. So, actually python is a higher level language written in C programming language. So, you can consider it in such a way that one day someone has written a C program called python.c and compile it to a file called python. And then if you add that output file path to the PATH env variable then you can execute the python by just writting "python". And the program is written in such a way that you can pass any filename in the argument and if the contents of the file are written acording to the documentation of python then the compiler or the program will eun the code. So, actually the C output file is only executing the code in the backend.

Now let's start with a simple code 👇

```python
import sys
if (len(sys.argv)==2):
    print("Hello {0}".format(sys.argv[1]))
else:
    sys.stderr.write("Usage {0} <name>\n".format(sys.argv[0]))
```

Now execute the file using 👇

```bash
python filename.py
```

So, you have to write this "python" everytime you execute a program. So, to avoid this you need to somehow mention in the progra that with what you want to execute this program as this is not an assembly level code.
Sp, you you can do this by using "shebang" 👇

```python
#!/usr/bin/python3
import sys
if (len(sys.argv)==2):
    print("Hello {0}".format(sys.argv[1]))
else:
    sys.stderr.write("Usage {0} <name>\n".format(sys.argv[0]))
```

Now you can execute the file just as your C file.

```bash
./filename.py
```

And if you want to remove the path and run it as a command then you know what to do, right?
But wait one more error will occur if you do this stating - "Permission denied"
So, this error occurs because the file is does not have executable options enabled. When you were mentioning **python filename.py** then there you were directly not executing the file. But here you are doing that. So, you have to make the file executable with "chmod".

After the shebang I wrote the path of the python compiler.
So, that's it for python now let's understand that how the compiled C program work.

## How CPU works 🛠🔧

So, suppose you are writting some instructions in a paer from top to bottom. So, like your line will have line number in computers also we have some numbers to point to that instruction. So, instead of the lines as 1, 2, 3, 4.... they are stored in hexadecimal values. So, now the assembly language have 8-32 global variables of fixed size called **Registers**. So, as mentioned these registers are of fixed size that is either 32-bit or 64-bit.
So, there are some important registers like 👇

- Program Counter or Instructuin Pointer(IP) or EIP or RIP. So, this pointer will contain the nextinstruction we will be executing. You can cosider that it contains the line number we will be executing next. So, everytime one instruction is executedwe advance the IP or PC.

Virtually all computations are expressed as simple operations on registers. Remember I wrote the values in hexadecimal. Like 👇

```assembly
mov eax, 0x5
add eax, 0x4
mov ebx, 0x2
sub eax, ebx
```

Actually we cannot write a real program using only 32 1-byte variables.
So, now if all the registers are filled up then we can store the next things in memory.
And you can acess values from memory by using loads and stores at addresses, i.e just like arrays or using PUSH and POP operation. So, let's see the first option 👇

```assembly
mov eax, [14]
```

So, here the value is retrived from the memory location 14.
Now stack is actually just like stacks we learned in programming. An amount of space or an array at the **bottom** of the memory. So, there is a special pointer called Stack Pointer or SP or ESP or RSP stores the value of the highest filled up point of the stack. So, as new elements are inserted into the stack the pointer moves up i.e decreases and as elements are removed the pointer again lowers or increase in value.
