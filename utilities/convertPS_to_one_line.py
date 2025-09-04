# Dan Jenkins 09/04/25
#
# Help utility to convert python scripts to one line.
#  
# There's probably already a tool for this, but reinventing the wheel can be fun. 

import argparse
import os
import pathlib

# Parse command line args
parser = argparse.ArgumentParser()
parser.add_argument("source_file", help="Path to Powershell script.", type=str)
parser.add_argument("target_directory", help="Target directory for the converted file.", type=str)
args = parser.parse_args()

# Check arguments
print(args.source_file)
print(args.target_directory)