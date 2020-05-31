#!/usr/bin/python3.8
'''
CheapScript Build System.
©2019 PlatinumMaster.
'''
import os
import subprocess
import sys
import pathlib

# Usage
usage = "CheapScript Build System\nUsage:\nFor a single script: make.py <script>\nFor a directory of scripts: make.py <script folder>"

# devkitARM
DEVKIT = pathlib.Path(os.environ.get('DEVKITARM'), 'bin')
AS = (DEVKIT / 'arm-none-eabi-as')
OBJCOPY = (DEVKIT / 'arm-none-eabi-objcopy')

def run_command(cmd):
	try:
		subprocess.check_output(cmd)
	except subprocess.CalledProcessError as e:
		print(e.output.decode(), file = sys.stderr)
		sys.exit(1)

def process_script(script, output):
	print("Creating %s" % script)
	run_command([AS, '-mthumb', '-c', script.as_posix(), '-o', output.stem + '.o'])
	run_command([OBJCOPY, '-O', 'binary', output.stem + '.o', output])
	(script.parent / (output.stem + '.o')).unlink()

def main():
	if len(sys.argv) >= 3: # Make Script
		process_script(pathlib.Path(sys.argv[1]), pathlib.Path(sys.argv[2]))
		print("Done!")
	else:
		print(usage)

main()
