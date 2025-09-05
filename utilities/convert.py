# Dan Jenkins 09/04/25
#
# Help utility to convert python scripts to one line.
#  
# There's probably already a tool for this, but reinventing the wheel can be fun.
# 
# The initial version of this program assumes that the original script is in a format that, 
# once converted into a single line, will execute correctly when passed to the -Command / -c parameter. 

import argparse
from pathlib import Path

# Parse command line args
parser = argparse.ArgumentParser()
parser.add_argument("source_file", help="Path to Powershell script.", type=str)
parser.add_argument("target_directory", help="Target directory for the converted file.", type=str)
args = parser.parse_args()

# Check if arguments exist
sfile = Path(args.source_file)
tdir = Path(args.target_directory)

if (not sfile.is_file()):
    msg = "convert.py: " + str(sfile) + ": No such file" 
    exit(msg)

if (not tdir.is_dir()):
    msg = "convert.py: " + str(tdir) + ": No such directory"
    exit(msg)

print(sfile)
print(tdir)

# Open source file