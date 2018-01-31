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
usage = "CheapScript Build System\nUsage:\n\"help\" - Displays this, then exits.\n\"build\" - Builds all of the scripts in the scripts folder.\n\"clean\" - Cleans the output folder.\n\"exit\" - Exits this program."

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

def batch_make_scripts():
	scripts = glob.glob('scripts/*.s')
	for script in scripts:
		process_assembly(script)
		
	objects = glob.glob("output/*.o")
	for object in objects:
		process_object(object)

def process_assembly(script):
	print("Assembling %s" % script)
	cmd = [AS] + [ASFLAGS] + ['-c', script, '-o', build_dir + os.path.splitext(os.path.basename(script))[0] + '.o']
	run_command(cmd)

def process_object(object):
	print("Making %s into binary" % object)
	cmd = [OBJCOPY, '-O', 'binary', object, build_dir + os.path.splitext(os.path.basename(object))[0] + '.bin']
	run_command(cmd)

def clean():
	confirmation = input('Using this option will remove all compiled scripts from the output folder. Are you sure you want to continue?\n')
	if confirmation.lower() == "yes":
		print("Cleaning build directory...")
		shutil.rmtree(build_dir)
		print("Done.")
	else:
		sys.exit(1)

def main(choice):
	if choice.lower() == "build":
		build_option = input('Choose option:\n1) Compile a script.\n2) Compile all scripts in the \"scripts\" folder.\n ')
		if build_option.lower() == "1":
			script_choice = input('Type the name of the script (no extension) you\'d like to compile. It must be in the script directory!\n')
			process_assembly(script_dir + script_choice + '.s')
			process_object(build_dir + script_choice + '.o')
			print("Done!")
			
		elif build_option.lower() == "2":
			batch_make_scripts()
			print("Done!")
		else:
			print("Invalid choice.")

	elif choice.lower() == "clean":
		clean()
	elif choice.lower() == "exit":
		sys.exit(0)
	else:
		print("Unrecognized option.\n")
		print(usage)
		main(input('What would you like to do?\n'))
try:
	main(sys.argv[1])
except IndexError:
	print(usage)
	main(input('What would you like to do?\n'))
