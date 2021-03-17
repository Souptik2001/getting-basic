# Radare2 basic commands

Ok first we need to analyze the binary. To do that we can run `aaa`.
After that we need to analyze the functions "function list". To do that we can run `afl`.
Now that we have all the functions analyzed we can move to any function.
And the prompt in the radare2 denotes the address we are in.

## Views

Ok now let's go to visual mode to see the calls and commands clearly. To do this type `V` and press enter.
Now to switch between diffrent visual views you can press `p` key (move forward). And to move backward we can press `P` key.
We can move down by pressing the down key and up by pressing the up key.
While you are in the visual mode if you want to execute commands then just type `:` and you will get a prompt at the bottom of the screen. To exit from that prompt just press `enter` without typing any command.
And remember that the line at the top of the screen is the line where you are at. You can also see the address of that line updating in the promt.
Now if there is a funciton call in that line then you can follow the funciton call by just pressing `enter` key.
So, you will be redirected to that function. If you want to move back from where you came you can press `u` key.
You can also freely navigate (SEEK) to any position of the code. Like if I want to move to the main function then I will open the prompt by pressing `:` and then type `s main`.
Ok Now to exit from the visual mode you can press `q`. And boom you return to your address prompt.
Now suppose you want to only display the main funciton without entering the visual mode. You can do that by typing `pdf @main` and pressing enter.

Now let's see that how you can use the graph mode. When there are lots of redirections and the code becomes too large to view it in the line by line view then we are in need for the graph mode.
We can enter the graph mode by typing `VV` and pressing enter.
In the graph mode also we can change graph types by `p` and `P`.
Write commands using `:`.
And exit by pressing `q` key.

## Analyze program

Now let's see how to run the program and debug:
To run the program we can use `ood`. And to run it with an argument we can use `ood argument`.
Now to set a break point at any address we can run `db address`.
To directly continue upto the breakpoint enter `dc`.
To see content of a register type ❌`px @registername`❌ `dr?registername` and press enter.

## Changing values

Ok now that we are able to analyze the program properly. Let's learn how to edit the values of registers and memory address.
Register: To edit register value use `dr registername = 0xvalue`
Memory : To edit a memory address value use `w text @ 0xaddress`(string) `w \x41\x41\x41\x41 @ 0xaddress`(number).
