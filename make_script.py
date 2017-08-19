#!/usr/bin/env python3

'''CheapScript Build System.
Based on a similar one by DizzyEgg.
©2017 PlatinumMaster.'''

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
Paths = os.environ.get('PATH').split(';')

with open("config.yml", 'r') as yamlfile:
			config = yaml.load(yamlfile)

for Path in Paths:
	if "devkitARM" in Path:
	   devkitPATH = Path
	   print ("devkitARM was detected at " + devkitPATH + ".")
	   break  
	else:
		print ("devkitARM was not found in your PATH.\nChecking the configuration for a path to devkitARM...")
		devkitPATH = config['general']['devkitARM PATH']
		if os.path.isdir(devkitPATH) == False:
			print ("The directory specified in your configuration file (" + devkitPATH + ") does not contain devkitARM.\nExiting...")
			sys.exit(1)
		else:
			print ("devkitARM was detected at " + devkitPATH + ".")
			break
				   
# Set up devkitARM for compilation.
PREFIX = 'arm-none-eabi-'
AS = (devkitPATH + PREFIX + 'as')
ASFLAGS = ['-mthumb']
OBJCOPY = (devkitPATH + PREFIX + 'objcopy')
BUILD = config['general']['Build Folder']
SOURCE = config['general']['Source Folder']

ScriptFiles = os.listdir(SOURCE)
ObjectFiles = os.listdir(BUILD)

def run_command(cmd):
	try:
		subprocess.check_output(cmd)
	except subprocess.CalledProcessError as e:
		print(e.output.decode(), file = sys.stderr)
		sys.exit(1)

def process_assembly():
	'''Assemble'''
	ScriptFiles.remove('commands')
	for script in ScriptFiles:
		print('Assembling ' + script)
		cmd = [AS] + [ASFLAGS] + ['-c', SOURCE + "/" + script, '-o', BUILD + '/' + script.replace('.s', '.o')]
		print(cmd)
		run_command(cmd)

def objcopy():
	for object in ObjectFiles:
		cmd = [OBJCOPY, '-O', 'binary', BUILD + '/' + object, BUILD + '/' + object.replace('.o', '.bin')]
		run_command(cmd)

def main(option):
	if option == "build":
		try:
			os.makedirs(BUILD)
		except FileExistsError:
			pass
		# Process Assembly & Make Binary
		process_assembly()
		objcopy()
		
	elif option == "clean":
		shutil.rmtree(BUILD)
		print ("Cleaned build directory.")
	elif option == "help":
		print ("Help:" + "\n" + "make_script.py <syntax>" + "\n" + "\n" + "build - Attempt to build the source." + "\n" + "clean - Delete files from a previous build." + "\n" + "help - Displays the list of commands.")
	elif option == "":
		print ("No arguments given. Run \"help\" to see the possible arguments.")
	else:
		print ("Unknown parameter. Run this program with the argument \"help\" to see the possible arguments.")
		
if __name__ == '__main__':
	main(sys.argv[1].lower())
    
    
    