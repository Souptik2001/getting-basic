# A small note before starting

This discussion is mainly realted to debugging and thus I will mostly compile c files for example. Sp the **-g** parameter during compiling of the program is important for debugging. If you miss this option then gdb will not work properly on the binary. Refer the second answer of this [Stackoverflow post](https://stackoverflow.com/questions/9245685/gdb-no-symbol-table-is-loaded).

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

So, here you see that you have to provide the path of the program in the bash. So, that can be avoided if you put the path of this program in the PATH environment variable.
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

So, next we need to talk about **GOTO** - jumps, branches or calls.

## Example

Ok so let's see an example to make it more clear.
Let's write an simple program for printing  fibonacci series upto 255 infinite number of terms. 👇

```c
#include<stdio.h>

int main(int argc, char* argv[]){
    int x, y, z;
    while(1){
        x=0;
        y=1;
        do{
            printf("%d\n", x);
            z=x+y;
            x=y;
            y=z;
        }while(x<255);
    }
    return 0;
}
```

So, first compile the file using gcc 👇

```bash
gcc -g fib.c -o fib -Wall
```

So, an executable file **fib** will be created.
Now, let's get the assembly code out of the *fib* file. So we will use gdb 👇

```bash
gdb fib.c
```

It will open a prompt like **(gdb)**. So, we ccan disassemble each function. So, here we have only one function main. So, let's disassemble *main* function. 👇

```bash
disassemble main
```

So, you have two styles of dumping assembly language **att** and **intel**.
You can swap between them and also see you present flavour by using 👇

```bash
set disassembly-flavor att
set disassembly-flavor intel
show disassembly-flavor
```

So, now after disassembly you will get the assembly code 👇

![Assembly Code](./fibonacci/disassembly_analysis.JPG)

So, the analysis of the code is also shown above.
Similarly try to analyze the assembly code of the key_cracking program provided in this repo.

So, understand the assembly language you must understand four concepts 👇

- Heap
- Stack
- Registers
- Instructions

### Heap

We can understand heap simply as a place to store data using malloc, calloc. Also the global and the static variables are stored in Heap.

## Registers

These are also storage places in memory and can store address values which are 8 bytes or less.
In the X86 architecture there are six general purpose registers - **eax, ebx, ecx, edx, esi, edi**.
There are also three registered special purposse registers - **ebp, esp, eip**. So, we will discuss them a bit later.
But before let's talk about stack.

## Stack

- Stack are just exactly like the stack data structure. As we know stack has two operations **push** and **pop**. As we know that stack grows from bottom to up. And as we know thaat memory address increase from top to bottom. So we can conclude that stack grows by decreasing address number i.e the newer element will have less address memory number than the old one.
- Whenever a function is called the function is stored in the stack called as stack frame i.e a part of the stack. IT contains many stack elements which contain all the local variables of the present function.
- Now let's talk about the special registers. **ebp** is the register which marks the base of the present stack frame. So, it is called the base pointer.
- **esp** is called the stack pointer and contains the address of the topmost element of the present stack frame. So, as one element is inserted into the stack the *esp* decreases by 1 and if popped then esp increases by 1.

Now let's see that how the stack behaves when a function is called. 👇

```c
#include<stdio.h>
#include<stdlib.h>
void func(int x;){
    int a=0;
    int b=x;
}
void main(){
    func(10);
}
```

So, now let's closely analyze that how the *func* function works 👇
(Remember that here I will write the numbers as hexadecimal format like 0x4 or 0xff, etc.)
First of all the argument value of the function is pushed on to the stack. Because you know that registers are not enough to store all the variable's value so memory is to be used. Then the return address is put on the stack. Then the **ebp** is put above the return address stack element and the **esp** is assigned same value to **ebp**. After this as elements are added to the stack the **esp** pointer moves up. This are bwtween the esp and the ebp is called the function's stack frame.These sequence of instructions are called function prologue.
Ok, so now first the value 0 is pushed in the stack frame as "a" is assigned as 0. So, can you tell the address of the local variable "a"? Yess, it is at address **ebp-0x4**. Its 4 because size of an integer is 4.
Now in the next step we assign the value of b to the argument value stored outside the present stack frame. Actually we can't copy the value outside this stack frame directly to the stack frame because we knoe that any value in the stack outside the current stack frame is considered junk by the current stack frame. So, here the general purpose registers comes in play. The value of the argument is moved to a general purpose register and then from the register it is copied to the stack frame.

## Assembly Language

Ok now let's analyze the assembly language in deep. So, there are two types of assembly language flavours - **att** and **intel**.
So, let's for now take intel in our consideration.
So, an assembly languagecontains insructions. Each instruction has two parts - **operation** and **argument**. An operation can take one or two arguments. If there are two arguments they are seperated by a ",". Like 👉 **operation arg1,arg2**.
So, let's take example of **mov** instruction. So, move instruction has two arguments. So, here it copies the value fro the lacation mentioned by its second argument to the location mentioned by its first argument.
Now there is a small twist here. Cosider a stack address of **ebp-0x8**, and we want to copy its value to a register let **eax**. So you can't write like 👇

```assembly
mov eax, ebx-0x8
```

Because ebx-0x8 is an address on the stack where the value is stored. So, actually here we have to dereference it just as we did in pointers in C/C++. Only difference is that there you used \* and here you use []. So, the syntax would be 👇

```assembly
mov eax, [ebx-0x8]
```

The **add** instruction adds the two arguments and store it in the firts argument.

The **sub** instruction does the same thing as the above only it substracts and add, adds. **arg1-arg2**.

The **push and pop** takes one argument. The **push** decreases the esp by one and places the arg at the position the esp is pointing at. The **pop** takes a register as argument. It copies the value pointed by the esp to the register and then increases the esp by 1.

The **lea** is the Load Effective address. Ti is used to put an address specified by its second argumet to the register specified by its first argument. Example 👇

```assembly
lea reg, addr
```

reg and addr will be the name of regster and value of the address respectively.

## Flow

Now let's get into the flow of the program.
So, every instruction has an instruction address which is the left most column in the assembly code. This is the are in memory where the instruction is stored.
So, the third special register is the **eip** or the instruction ponter. This contains the address of the instruction to be executed. So, the computer always executed the instruction in the address contained in the instruction pointer.
Again le's get back to some of the instructions.

## Some more instructions

The **cmp** or the compare instruction is just like compairision in your programs you write. But, here you have to understand that how it works. So, for that you can compare it with the *sub* instruction. So, the second argument is substracted from the first argument (arg1-arg2) and the result is not stored in the first argument as it was in the *sub*. Instead it will set a flag in the processor that contains the value equas to 0, greater than 0 or less than zero. For example if you run **cmp 0x1,0x3**. So, (1-3) is (-2) and therefore <0 will be set in the flag.

The **cmp** instruction is always followed by a jump instruction. The jusmp instruction reacts according to the state of the flag. There are many types of jump instructions - **je (jump if equal to), jne (jump if not equal to), jg (jump if greater than), jl (jump if less than)**. So, if suppose the flag is set to <0 and we use jne then it will execute. If the flag is >0 and we use jl then it will not be executed. Oh we talked about executuion but what is the execution? Actually if the instruction is executed then the eip (instruction pointer) will be set to the argument of the jump instruction which is nothing but an address of an instruction.

The **call** instruction used for calling any function be it user defined or default function. It has one argument like **call func**. It actually does two steps 👇

```assembly
push eip
jmp func
```

So, it pushes the present instruction address onto the stack and then moves the eip to the function address.

The **leave** instruction is called at the end of every function. It actually destroyes the current stack frame by setting the esp=ebp and popping the base pointer of the stack.

The **ret** (or return) instruction always follows the leave instruction. Since the base pointer is popped out of the stack the return address is at the top of the stack. So the return address will be popped out and the eip will be set equal to the return address.
