#!/usr/bin/env python3

from glob import glob
from pathlib import Path
import os
import itertools
import subprocess
import sys
import yaml
import shutil

''' devkitARM PATH detection. '''

devkitPATH = ""
Platform = platform.system()
Paths = os.getenviron('PATH').split(';')

with open("config.yml", r) as yamlfile:
			config = yaml.load(ymlfile)

for Path in Paths:
	if "devkitARM" in Path:
	   devkitPATH = Path
	   print "devkitARM was detected at " + devkitPATH + "."
	   break  
	else:
		print "devkitARM was not found in your PATH.\nChecking the configuration for a path to devkitARM..."
		devkitPATH = config['general']['devkitARM_PATH']
		if os.path.isdir(devkitPATH) == False:
			print "The directory specified in your configuration file (" + devkitPATH + ") does not contain devkitARM.\nExiting..."
	   	sys.exit(1)
		else:
			print "devkitARM was detected at " + devkitPATH + "."
	   
# Set up devkitARM for compilation.
PREFIX = 'arm-none-eabi-'
AS = (PATH + PREFIX + 'as')
ASFLAGS = ['-mthumb']
OBJCOPY = (PATH + PREFIX + 'objcopy')
BUILD = config['general']['Build Folder']
SOURCE = config['general']['Source Folder']

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

def run_glob(globstr, fn):
	'''Glob recursively and run the processor function on each file in result'''
	if sys.version_info > (3, 4):
		files = glob(os.path.join(SOURCE, globstr), recursive = True)
		return map(fn, files)
	else:
		files = Path(SOURCE).glob(globstr)
		return map(fn, map(str, files))

def main(option):
	if option == "build":
		globs = {
			'commands/B2W2.s': ignore,
			'.s': process_assembly
		}

		try:
			os.makedirs(BUILD)
			
		except FileExistsError:
			pass
		
		# Process Assembly & Make Binary
		objects = itertools.starmap(run_glob, globs.items())
		objcopy(objects)
		
	elif option == "clean":
		os.removedirs(BUILD)
		print "Cleaned build directory."
		
	elif option == "help":
		print "Help:" + "\n" + "make_script.py <syntax>" + "\n" + "\n" + "build - Attempt to build the source." + "\n" + "clean - Delete files from a previous build." + "\n" + "help - Displays the list of commands."

	else:
		print "Unknown parameter. Run this program with the argument \"help\" to see the proper commands."

if __name__ == '__main__':
	main(sys.argv[1].lower())
    
    