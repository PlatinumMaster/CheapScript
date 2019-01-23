'''
CheapScript Build System.
©2019 PlatinumMaster.
'''
import glob
import os
import subprocess
import sys
import shutil

# Usage
usage = "CheapScript Build System\nUsage:\nFor a single script: make.py <script>\nFor a directory of scripts: make.py <script folder>"

# devkitARM
devkitPATH = ''
if sys.platform == 'win32':
	devkitPATH = 'C://devkitPro/devkitARM/bin/'
else:
	devkitPATH = '/opt/devkitPro/devkitARM/bin'

PREFIX = 'arm-none-eabi-'
AS = (devkitPATH + PREFIX + 'as')
ASFLAGS = '-mthumb'
OBJCOPY = (devkitPATH + PREFIX + 'objcopy')

def run_command(cmd):
	try:
		subprocess.check_output(cmd)
	except subprocess.CalledProcessError as e:
		print(e.output.decode(), file = sys.stderr)
		sys.exit(1)

def batch_make_scripts():
	scripts = glob.glob(os.path.join(sys.argv[1], '*.s'))
	for script in scripts:
		process_assembly(script)

	objects = glob.glob(os.path.join(sys.argv[1], '*.o'))
	for object in objects:
		process_object(object)

	print("Done!")

def process_assembly(script):
	print("Assembling %s" % script)
	cmd = [AS] + [ASFLAGS] + ['-c', script, '-o', os.path.splitext(script)[0] + '.o']
	run_command(cmd)

def process_object(object):
	print("Making %s into binary" % object)
	cmd = [OBJCOPY, '-O', 'binary', object, os.path.splitext(object)[0] + '.bin']
	run_command(cmd)

def main():
	if len(sys.argv) < 2:
		print(usage)
	elif len(sys.argv) >= 2 and os.path.isdir(sys.argv[1]): # Batch Make Scripts
		batch_make_scripts()
	elif len(sys.argv) >= 2 and os.path.isdir(sys.argv[1]) == False: # Make Script
		process_assembly(sys.argv[1])
		process_object(os.path.splitext(sys.argv[1])[0] + '.o')
		print("Done!")

main()
