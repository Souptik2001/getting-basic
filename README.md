# Let's Start small

Let's start with a simple C code 👇

```C
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

So, here you see that you have to provide the path of the program in the bash. So, that can be avoe=ided if you put the path of this program in the PATH environment variable.
That can be easily done like 👇

```bash
export PATH=$PATH:/yourpath
```

Remember to always give the absolute path.
Now you can acess you executable program from anywhre just using the name of you program just like inbuild commands like 'ls',  etc.

'argc' is actually the argument count and the 'argv' is the vector or array of the arguments.
To understand this in greater detail you might want to understand that how arguments are passed from the shell to the program.
Actually all the space seperated words are one argument starting from the promt. So, if you have four space-seperated words, then you have four arguments.
Example 👇

***prompt $*** outputname arg2 arg3
                arg[0]   arg[1] arg[2]

If you want two to place a space between two words but want to get them as only one arg then you have to use "" like 👇

Lets modify the program a bit 👇

```C
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

Next let's take a mordern language like Python 🐍
