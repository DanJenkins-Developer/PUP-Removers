import sys
import os

# total arguments
n = len(sys.argv)
print("Total arguments passed: ", n)


if n == 1:
    print("This program requires a file path as an argument")
    exit
if n > 2:
    print("Too many arguments")
    exit

    



print(sys.argv[1])