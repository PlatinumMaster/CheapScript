import struct
import sys
import os
from pathlib import Path
from commands import *
from movements import *

function_map = {}
movement_map = {}
script_addr = []
s = 0
filesize = 0

def process_container(script_container):
    global s
    global script_addr
    global filesize

    s = Path(script_container).open('rb')
    filesize = len(s.read())
    s.seek(0, 0)
    while True:
        script_addr.append(struct.unpack('<L', s.read(4))[0] + s.tell())
        if struct.unpack('<H', s.read(2))[0] == 0xFD13:
            break    
        s.seek(-2, 1)
        
    print('.include "commands.s"\n')
    print('.include "movements.s"\n')

    print('Header:')
    for x in range(0, len(script_addr)):
        print('    script Script%d' % x)   
    print('    EndHeader')
    for x in script_addr:
        print ('Script%d:' % script_addr.index(x))
        process_script_commands(x)
               
    for x in movement_map.keys():
        print ('Movement%d:' % movement_map[x])
        process_movements(x)

        
def process_script_commands(script): 
    global filesize
    global script_addr
    functions = []
    s.seek(script, 0)
    
    while True:
        pos = s.tell()
        cmd_num = struct.unpack('<H', s.read(2))[0]
        params = []
        isFunction = False
        isMovement = False
        addr = 0
        try: 
            cmd = commands[cmd_num]
            if cmd[1] != None:
                params = [hex(x) for x in list(struct.unpack(cmd[1], s.read(struct.calcsize(cmd[1]))))]
                if cmd[0] == 'If' or cmd[0] == 'When':
                    addr = s.tell() + int(params[1], 16)
                    isFunction = True
                elif cmd[0 == 'Jump' or cmd[0] == 'CallRoutine':
                    addr = s.tell() + int(params[0], 16)            
                    isFunction = True
                elif cmd[0] == 'ApplyMovement':
                    addr = s.tell() + int(params[1], 16)
                    isMovement = True

                addr &= 0xFFFFFFFF

                if isFunction and addr not in function_map.keys():
                    functions.append(addr)
                    function_map[addr] = len(function_map)
                elif isMovement and addr not in movement_map.keys():
                    movement_map[addr] = len(movement_map)

                if isFunction:
                    params[len(params) - 1] = ('Function%d' % function_map[addr])
                elif isMovement:
                    params[len(params) - 1] = ('Movement%d' % movement_map[addr])

            print('    %s %s @%s' % (cmd[0], ' '.join(e for e in params), hex(pos)))  
            
            if cmd[0] == 'End' or cmd[0] == 'Jump':
                break
            elif cmd[0] == 'EndRoutine':
                next = s.read(1)
                if next == 0 or s.tell() - 1 in script_addr or s.tell() - 1 in movement_map.keys():
                    s.seek(-1, 1)
                    break
                s.seek(-1, 1)

        except KeyError:
            s.seek(-2, 1)
            print('    .byte %s @%s' % (hex(struct.unpack('<B', s.read(1))[0]), hex(pos)))
        
    for x in functions:
        print ('Function%d:' % function_map[x])
        process_script_commands(x)
        
def process_movements(movement):
    s.seek(movement, 0)    
    while True:
        movement_info = struct.unpack('<HH', s.read(4))
        if movement_info[0] == 0xFE:
            print('    EndMovement')
            break
        else:
            try:
                print('    Movement %s %s' % (movements[movement_info[0]], hex(movement_info[1])))
            except:         
                print('    Movement %s %s' % (hex(movement_info[0]), hex(movement_info[1])))

process_container(sys.argv[1])