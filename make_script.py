#!/usr/bin/env python3
'''
CheapScript Build System.
©2018 PlatinumMaster.
'''
import glob
import os
import subprocess
import sys
import shutil

# Usage
usage = "CheapScript Build System\nUsage:\n\"help\" - Displays this, then exits.\n\"build\" - Builds all of the scripts in the scripts folder.\n\"clean\" - Cleans the output folder."

# devkitARM
devkitPATH = 'C://devkitPro/devkitARM/bin/'
PREFIX = 'arm-none-eabi-'
AS = (devkitPATH + PREFIX + 'as')
ASFLAGS = ['-mthumb']
OBJCOPY = (devkitPATH + PREFIX + 'objcopy')

# Make output directory if it doesn't already exist.
try:
	os.makedirs('output')
except FileExistsError:
	pass
			
# Directory definitions.
build_dir = os.getcwd() + "/output/"
script_dir = os.getcwd() + "/scripts/"

def run_command(cmd):
	try:
		subprocess.check_output(cmd)
	except subprocess.CalledProcessError as e:
		print(e.output.decode(), file = sys.stderr)
		sys.exit(1)
	
def process_assembly():
	scripts = os.listdir(script_dir)
	for script in scripts:
		print("Assembling %s" % script)
		cmd = [AS] + [ASFLAGS] + ['-c', script_dir + script, '-o', build_dir + script.replace('.s', '.o')]
		run_command(cmd)
		
def process_objects():
	objects = os.listdir(build_dir)
	for object in objects:
		if object[-4:] == ".o":
			pass
		else:	
			print("Making %s into binary" % object)
			cmd = [OBJCOPY, '-O', 'binary', build_dir + object, build_dir + object.replace('.o', '.bin')]
			run_command(cmd)
			
def clean():
	confirmation = input('Using this option will remove all compiled scripts from the output folder. Are you sure you want to continue? ')
	if confirmation.lower() == "yes":
		print("Cleaning build directory...")
		shutil.rmtree(build_dir)
		print("Done.")
	else:
		sys.exit(1)

def main(choice):
	if choice.lower() == "build":
		process_assembly()
		process_objects()
	elif choice.lower() == "clean":
		clean()
	else:
		print("Unrecognized option.\n")
		print(usage)
try:
	main(sys.argv[1])
except IndexError:
	print("No parameters given.\n")
	print(usage)