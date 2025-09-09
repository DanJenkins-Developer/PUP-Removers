# Dan Jenkins 09/04/25
#
# Helper utility to convert Powershell scripts to one line to be used in Elastic response actions.
# There's probably already a tool for this, but reinventing the wheel can be fun.
# 
# The initial version of this program removes white space characters and comments from scripts,
# but otherwise assumes that the original script is in a format that, once converted 
# into a single line, will execute correctly when passed to the -Command / -c parameter. 

def lineConditionsMet(l : str):
    met = True
    if (l == "" or 
        l.startswith("#")):

        met = False
    
    return met

import argparse
from pathlib import Path

# Parse command line args. Source powershell script and a target directory for the reduced script are required.
parser = argparse.ArgumentParser()
parser.add_argument("source_file", help="Path to Powershell script.", type=str)
parser.add_argument("target_directory", help="Target directory for the converted file.", type=str)
args = parser.parse_args()

# Check if the user provided arguments exist.
sfile = Path(args.source_file)
tdir = Path(args.target_directory)

if (not sfile.is_file()):
    msg = f"convert.py: {str(sfile)} : No such file" 
    exit(msg)

if (not tdir.is_dir()):
    msg = f"convert.py: {str(tdir)} : No such directory"
    exit(msg)

# Open source file.
with sfile.open('r') as script:
    content = script.readlines()

# Modify list.
content = [line.strip() for line in content if lineConditionsMet(line.strip())]

# create one line with space splitting them
one_line = ' '.join(content)

# Write out to a new file
fname = 'tempname.ps1'
with open(tdir / fname, 'w') as f:
    f.write(one_line)