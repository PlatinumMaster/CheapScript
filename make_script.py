#!/usr/bin/env python3


from glob import glob

from pathlib import Path

import os
import itertools
import subprocess
import sys
import platform

devkitPATH = ""

Platform = platform.system()

Paths = os.getenviron('PATH').split(';')

for Path in Paths:
	if "devkitARM" in Path:
	   devkitPATH = Path
	   print "devkitARM was detected at " + Path + "."
	   break
	else:
		print "Hmm, devkitARM can't be found in your PATH.\n I will try looking in the default directory for your operating system."
		if Platform == "Windows":
			PATH = 'C://devkitPro//devkitARM//bin'		
			if os.path.isdir(PATH) == False:
				print "devkitARM cannot be found at the default location.\nPlease make sure it was properly installed and try again."
				sys.exit(1)
			else:
				print "Found it."
				
		elif Platform == "Linux":
			PATH = "/opt/devkitPro/devkitARM/bin/"
			if os.path.isdir(PATH) == False:
				print "devkitARM cannot be found at the default location.\nPlease make sure it was properly installed and try again."
				sys.exit(1)
			else:
				print "Found it."
				
		else:
			print("Unknown platform.")
			sys.exit(1)

PREFIX = 'arm-none-eabi-'
AS = (PATH + PREFIX + 'as')
OBJCOPY = (PATH + PREFIX + 'objcopy')
BUILD = './build'
ASFLAGS = ['-mthumb']

def run_command(cmd):
	try:
		subprocess.check_output(cmd)
	except subprocess.CalledProcessError as e:
		print(e.output.decode(), file = sys.stderr)
		sys.exit(1)

def process_assembly(in_file):
	'''Assemble'''
	print ('Assembling %s' % in_file)
	cmd = [AS] + [ASFLAGS] + ['-c', in_file, '-o', BUILD + "//" + in_file.replace(".s", ".o")]
	run_command(cmd)
	return out_file

def objcopy(binary):
	cmd = [OBJCOPY, '-O', 'binary', binary, binary.replace('.o', '.bin')]
	run_command(cmd)


def main():
	# Create output directory
	try:
		os.makedirs(BUILD)
	except FileExistsError:
		pass
		
	# Process Assembly	
	process_assembly(sys.argv(1))

	# Gather source files and process them
	objcopy(sys.argv(1).replace(".s", ".o"))

if __name__ == '__main__':
	main()
    